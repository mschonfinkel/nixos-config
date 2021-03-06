{pkgs, home, ...}:

let
  dotfiles = ../dotfiles;
  # Convert a string to dotfiles path format
  dpath = p: builtins.toString "${dotfiles}/${p}";
in
{
  home.packages = with pkgs; [
    fzf
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      icat="kitty +kitten icat";
      hstat="curl -o /dev/null --silent --head --write-out '%{http_code}\n' $1";
      l="ls -l";
      ls="ls -h --group-directories-first --color=auto";
      la="ls -lAh --group-directories-first --color=auto";
      pss="pass show";
      pssc="pass show --clip";
      r="ranger";
      xcc="xclip -sel clipboard";
      vi="nvim";
      vim="nvim";
    };
    history = {
      size = 5000;
      ignoreDups = true;
    };
    initExtra = builtins.readFile "${dotfiles}/zsh/zshrc";
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      directory = {
        truncation_length = 2;
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };
      # Git
      git_commit = {
        disabled = false;
      };
      # Hostname
      hostname = {
        ssh_only = false;
        format = "⟪[$hostname]($style)⟫ ";
      };
      username.show_always = true;
    };
  };

  home.sessionVariables = {
    SPACESHIP_EXIT_CODE_SHOW = "true";
  };
}
