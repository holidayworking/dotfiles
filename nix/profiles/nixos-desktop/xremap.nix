{
  username,
  ...
}:
{
  services = {
    xremap = {
      enable = true;
      serviceMode = "user";
      userName = "${username}";
      withGnome = true;

      config = {
        modmap = [
          {
            name = "Global";
            remap = {
              "CapsLock" = "Ctrl_L";
            };
          }
        ];

        keymap = [
          {
            name = "Global";
            application.not = [
              "Code"
              "com.mitchellh.ghostty"
            ];
            remap = {
              "C-a" = "home";
              "C-e" = "end";
              "Super-a" = "C-a";
              "Super-c" = "C-c";
              "Super-f" = "C-f";
              "Super-s" = "C-s";
              "Super-v" = "C-v";
              "Super-x" = "C-x";
              "Super-z" = "C-z";
            };
          }
          {
            name = "Ghostty";
            application = {
              only = [
                "com.mitchellh.ghostty"
              ];
            };
            remap = {
              "Super-a" = "C-Shift-a";
              "Super-c" = "C-Shift-c";
              "Super-f" = "C-Shift-f";
              "Super-v" = "C-Shift-v";
              "Super-x" = "C-Shift-x";
              "Super-z" = "C-Shift-z";
            };
          }
        ];
      };
    };
  };
}
