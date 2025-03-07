#!/usr/bin/env bash
# update_mc_server_blacklist.sh

set -euo pipefail

# Check if the script is being run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

TXT_URLS=(
	"https://raw.githubusercontent.com/X4BNet/lists_vpn/refs/heads/main/ipv4.txt"
	"https://raw.githubusercontent.com/platformbuilds/Tor-IP-Addresses/refs/heads/master/tor-exit-nodes.lst"
	"https://raw.githubusercontent.com/iamshab/Malicious-IPs-Feed/refs/heads/main/AFAT-Clean-IPs.txt"
	"https://raw.githubusercontent.com/sefinek/Malicious-IP-Addresses/refs/heads/main/lists/main.txt"
    "https://raw.githubusercontent.com/jhassine/server-ip-addresses/refs/heads/master/data/datacenters.txt"
)

is_ipv4() {
    [[ "$1" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] && return 0 || return 1
}

TEMP_FILE=$(mktemp)

for URL in "${TXT_URLS[@]}"; do
	echo "Downloading $URL..."
	curl -s "$URL" >> "$TEMP_FILE"
done

URL="https://raw.githubusercontent.com/Lars-/PIA-servers/refs/heads/master/export.csv"
echo "Downloading $URL..."
curl -s "$URL" | tail -n +2 | cut -d',' -f1 >> "$TEMP_FILE"

SORTED_FILE=$(mktemp)
sort -u "$TEMP_FILE" | uniq > "$SORTED_FILE"

if ! ipset list mc_server_blacklist &>/dev/null; then
	echo "Creating ipset mc_server_blacklist..."
	ipset create mc_server_blacklist hash:net
fi

echo "Adding IPs to ipset mc_server_blacklist..."
while read -r ip; do
	if is_ipv4 "$ip"; then
		ipset add -! mc_server_blacklist "$ip"
	fi
done < "$SORTED_FILE"

echo "Updateing iptables rules"
if ! iptables -C DOCKER-USER -m set --match-set mc_server_blacklist src -d 192.168.100.0/24 -j LOG --log-prefix "IP Blacklisted DOCKER-USER" &>/dev/null; then
    iptables -I DOCKER-USER 1 -m set --match-set mc_server_blacklist src -d 192.168.100.0/24 -j LOG --log-prefix "IP Blacklisted DOCKER-USER"
fi
if ! iptables -C DOCKER-USER -m set --match-set mc_server_blacklist src -d 192.168.100.0/24 -j DROP &>/dev/null; then
    iptables -I DOCKER-USER 2 -m set --match-set mc_server_blacklist src -d 192.168.100.0/24 -j DROP
fi

rm "$TEMP_FILE" "$SORTED_FILE"

echo "Blacklist update complete!"
