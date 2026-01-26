#!/usr/bin/env bash

#set -euo pipefail

TXT_URLS=(
	# "https://raw.githubusercontent.com/X4BNet/lists_vpn/refs/heads/main/ipv4.txt"
	"https://raw.githubusercontent.com/platformbuilds/Tor-IP-Addresses/refs/heads/master/tor-exit-nodes.lst"
	"https://raw.githubusercontent.com/iamshab/Malicious-IPs-Feed/refs/heads/main/AFAT-Clean-IPs.txt"
	"https://raw.githubusercontent.com/sefinek/Malicious-IP-Addresses/refs/heads/main/lists/main.txt"
    # "https://raw.githubusercontent.com/jhassine/server-ip-addresses/refs/heads/master/data/datacenters.txt"
)

ASNS=(
    "AS36680"  # Netiface LLC
    "AS60223"  # Netiface Limited
    "AS51396"  # Pfcloud UG
    "AS208191" # Go Host Ltd
    "AS31898"  # Oracle Public Cloud
    "AS12876"  # Scaleway Hosting
)

is_ipv4() {
    [[ "$1" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}(\/[0-9]{1,2})?$ ]] && return 0 || return 1
}

TEMP_FILE=$(mktemp)

for URL in "${TXT_URLS[@]}"; do
	echo "Downloading $URL..."
	curl -s "$URL" >> "$TEMP_FILE"
done

# Special case for this CSV file
URL="https://raw.githubusercontent.com/Lars-/PIA-servers/refs/heads/master/export.csv"
echo "Downloading $URL..."
curl -s "$URL" | tail -n +2 | cut -d',' -f1 >> "$TEMP_FILE"

for ASN in "${ASNS[@]}"; do
    echo "Looking up IP ranges for $ASN..."
    whois -h whois.radb.net -- "-i origin $ASN" | grep -Eo "([0-9.]+){4}/[0-9]+" >> "$TEMP_FILE"
done

SORTED_FILE=$(mktemp)
sort -u "$TEMP_FILE" | uniq > "$SORTED_FILE"

if ! ipset list minecraft_server_blacklist &>/dev/null; then
	echo "Creating ipset minecraft_server_blacklist..."
	ipset create minecraft_server_blacklist hash:net maxelem 1048575
fi

echo "Adding IPs to ipset minecraft_server_blacklist..."
while read -r ip; do
	if is_ipv4 "$ip"; then
		ipset add -! minecraft_server_blacklist "$ip"
	fi
done < "$SORTED_FILE"

echo "Updateing iptables rules"
if ! iptables -C DOCKER-USER -m set --match-set minecraft_server_blacklist src -d 10.100.1.0/24 -j LOG --log-prefix "IP Blacklisted DOCKER-USER" &>/dev/null; then
    iptables -I DOCKER-USER 1 -m set --match-set minecraft_server_blacklist src -d 10.100.1.0/24 -j LOG --log-prefix "IP Blacklisted DOCKER-USER"
fi
if ! iptables -C DOCKER-USER -m set --match-set minecraft_server_blacklist src -d 10.100.1.0/24 -j DROP &>/dev/null; then
    iptables -I DOCKER-USER 2 -m set --match-set minecraft_server_blacklist src -d 10.100.1.0/24 -j DROP
fi

rm "$TEMP_FILE" "$SORTED_FILE"

echo "Blacklist update complete!"
