{
  delib,
  host,
  mcpServers,
  inputs,
  pkgs,
  ...
}:
delib.module {
  name = "programs.cursor";

  home.always = {
    home = {
      packages = with pkgs; [
        llm-agents.cursor-agent
      ];

      file.".cursor/mcp.json".source = inputs.mcp-servers-nix.lib.mkConfig pkgs mcpServers;
    };

    programs.vscode = {
      enable = host.isDesktop;
      package = pkgs.code-cursor;

      profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;

        # cspell:disable
        extensions = with pkgs.open-vsx; [
          anthropic.claude-code
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
          redhat.vscode-yaml
          renesaarsoo.sql-formatter-vsc
          streetsidesoftware.code-spell-checker
          timonwong.shellcheck
          tombonnike.vscode-status-bar-format-toggle
          tyriar.sort-lines
          vscode-icons-team.vscode-icons
        ];
        # cspell:enable

        userSettings = {
          "cursor.composer.usageSummaryDisplay" = "always";
          "editor.codeActionsOnSave"."source.fixAll.eslint" = "explicit";
          "editor.defaultFormatter" = "esbenp.prettier-vscode"; # cspell:disable-line
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
          "remote.autoForwardPortsSource" = "process";
          "gitlens.rebaseEditor.openOnPausedRebase" = false;
          "remote.SSH.remotePlatform"."gemini" = "linux";
          "shfmt.executableArgs" = [
            "--indent"
            "2"
          ];
          "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide"; # cspell:disable-line
          "[shellscript]"."editor.defaultFormatter" = "mkhl.shfmt"; # cspell:disable-line
          "[sql]"."editor.defaultFormatter" = "ReneSaarsoo.sql-formatter-vsc"; # cspell:disable-line
          "[terraform]"."editor.defaultFormatter" = "hashicorp.terraform";
        };
      };
    };
  };
}
