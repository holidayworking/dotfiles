{
  flake.modules.homeManager.desktop =
    { pkgs, inputs, ... }:
    {
      programs.vscode = {
        enable = true;
        package = pkgs.code-cursor;

        profiles.default = {
          enableUpdateCheck = false;
          enableExtensionUpdateCheck = false;

          extensions = with pkgs.open-vsx; [
            apollographql.vscode-apollo
            christian-kohler.path-intellisense
            davidanson.vscode-markdownlint
            dbaeumer.vscode-eslint
            eamodio.gitlens
            esbenp.prettier-vscode
            github.github-vscode-theme
            github.vscode-github-actions
            hashicorp.terraform
            jnoortheen.nix-ide
            mkhl.shfmt
            mylesmurphy.prettify-ts
            openai.chatgpt
            redhat.vscode-yaml
            renesaarsoo.sql-formatter-vsc
            streetsidesoftware.code-spell-checker
            timonwong.shellcheck
            tombonnike.vscode-status-bar-format-toggle
            tyriar.sort-lines
            vscode-icons-team.vscode-icons
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
            "gitlens.rebaseEditor.openOnPausedRebase" = false;
            "remote.SSH.remotePlatform"."gemini" = "linux";
            "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
            "[shellscript]"."editor.defaultFormatter" = "mkhl.shfmt";
            "[sql]"."editor.defaultFormatter" = "ReneSaarsoo.sql-formatter-vsc";
            "[terraform]"."editor.defaultFormatter" = "hashicorp.terraform";
          };
        };
      };

      home.file.".cursor/mcp.json".source = inputs.self.mkMcpConfig pkgs { };
    };
}
