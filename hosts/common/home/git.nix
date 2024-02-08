{
  programs.git = {
    enable = true;
    userName = "Jakub Ječmínek";
    userEmail = "kuba@kubajecminek.cz";
    extraConfig = {
      init = {
        defaultBranch = "master";
      };

      core = {
        editor = "nvim";
      };

      color = {
        ui = "auto";
      };

      sendemail = {
        smtpEncryption = "starttls";
        smtpServer = "127.0.0.1";
        smtpUser = "kuba@kubajecminek.cz";
        smtpServerPort = 1025;
      };
    };
  };
}
