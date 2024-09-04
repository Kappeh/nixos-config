{ pkgs, ... }: pkgs.runCommand "Sunity-cursors" {} ''
  mkdir -p $out/share/icons
  ln -s ${builtins.fetchGit {
    url = "https://github.com/alvatip/Sunity-cursors.git";
    ref = "main";
    rev = "0f4e80186dc0b8dc9caeea1e974186d394fc8b0e";
  }}/Sunity-cursors $out/share/icons/Sunity-cursors
''
