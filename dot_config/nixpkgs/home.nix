{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rob";
  home.homeDirectory = "/home/rob";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    # System Utils
    pkgs.btop
    pkgs.git
    pkgs.curl
    pkgs.direnv
    pkgs.silver-searcher
    # Languages
    pkgs.nodejs-16_x
    pkgs.python39
    pkgs.python39Packages.pipx
    pkgs.php81
    pkgs.php81Packages.composer
    pkgs.rustup
    # Applications
  ];

  programs.jq.enable = true;
  programs.topgrade.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      wget = "wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\"";
    };
    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-foreign-env";
            rev = "b3dd471bcc885b597c3922e4de836e06415e52dd";
            sha256 = "3h03WQrBZmTXZLkQh1oVyhv6zlyYsSDS7HTHr+7WjY8=";
        };
      }
      {
        name = "bobthefish";
        src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "theme-bobthefish";
            rev = "2dcfcab653ae69ae95ab57217fe64c97ae05d8de";
            sha256 = "jBbm0wTNZ7jSoGFxRkTz96QHpc5ViAw9RGsRBkCQEIU=";
        };
      }
      {
        name = "bang-bang";
        src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-bang-bang";
            rev = "f969c618301163273d0a03d002614d9a81952c1e";
            sha256 = "A8ydBX4LORk+nutjHurqNNWFmW6LIiBPQcxS3x4nbeQ=";
        };
      }
    ];
  };
}
