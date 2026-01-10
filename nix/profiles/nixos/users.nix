{
  username,
  ...
}:
{
  users = {
    groups = {
      "${username}" = {
        gid = 1000;
      };
    };

    users = {
      root.hashedPassword = "!";

      "${username}" = {
        extraGroups = [
          "docker"
          "wheel"
        ];
        group = "${username}";
        isNormalUser = true;
        uid = 1000;
      };
    };
  };
}
