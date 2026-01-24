{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        package = pkgs.code-cursor;

        profiles.default = {
          extensions =
            with pkgs.vscode-extensions;
            [
              apollographql.vscode-apollo
              christian-kohler.path-intellisense
              davidanson.vscode-markdownlint
              dbaeumer.vscode-eslint
              esbenp.prettier-vscode
              github.github-vscode-theme
              github.vscode-github-actions
              hashicorp.terraform
              jnoortheen.nix-ide
              mkhl.shfmt
              redhat.vscode-yaml
              streetsidesoftware.code-spell-checker
              timonwong.shellcheck
              tyriar.sort-lines
              vscode-icons-team.vscode-icons
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "prettify-ts";
                publisher = "mylesmurphy";
                version = "0.3.9";
                sha256 = "ee0IWbOQO7DEJohjPN/kIvgyilpJRqK3fIDQjN9rhrw=";
              }
              {
                name = "sql-formatter-vsc";
                publisher = "renesaarsoo";
                version = "4.2.5";
                sha256 = "/pG0tG3BwJYKFCDc44WhFWNjPC+1G6H+3xsC0MIWDN4=";
              }
              {
                name = "vscode-status-bar-format-toggle";
                publisher = "tombonnike";
                version = "3.2.0";
                sha256 = "MuDOhp6Ur5iwzHjyK7qEVSGOQovfWPwwYJ0Sl/RsIQE=";
              }
            ];

          userSettings = {
            "editor.codeActionsOnSave"."source.fixAll.eslint" = "explicit";
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
            "editor.fontFamily" = "FiraCode Nerd Font";
            "editor.fontLigatures" = true;
            "editor.fontSize" = 14;
            "editor.lineHeight" = 16;
            "editor.renderLineHighlight" = "none";
            "editor.renderWhitespace" = "boundary";
            "editor.rulers" = [ 120 ];
            "editor.tabSize" = 2;
            "editor.wordWrap" = "on";
            "editor.formatOnPaste" = true;
            "editor.formatOnSave" = true;
            "editor.formatOnType" = true;
            "files.insertFinalNewline" = true;
            "files.trimTrailingWhitespace" = true;
            "workbench.activityBar.orientation" = "vertical";
            "workbench.colorTheme" = "GitHub Dark Default";
            "workbench.iconTheme" = "vscode-icons";
            "terminal.integrated.fontFamily" = "FiraCode Nerd Font";
            "terminal.integrated.fontLigatures.enabled" = true;
            "terminal.integrated.fontSize" = 14;
            "remote.SSH.remotePlatform"."gemini" = "linux";
            "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
            "[shellscript]"."editor.defaultFormatter" = "mkhl.shfmt";
            "[sql]"."editor.defaultFormatter" = "ReneSaarsoo.sql-formatter-vsc";
            "[terraform]"."editor.defaultFormatter" = "hashicorp.terraform";
          };
        };
      };
    };
}
