{config, ...}: {
  programs.mbsync = {
    enable = true;
  };

  home.file.".mbsyncrc".text = ''
    IMAPAccount yhetil
    Host news.yhetil.org
    User ANONYMOUS
    SSLType IMAPS
    CertificateFile /etc/ssl/certs/ca-certificates.crt

    IMAPStore yhetil-remote
    Account yhetil

    MaildirStore yhetil-local
    Subfolders Verbatim
    Path /data/Mail/

    Channel yhetil
    Far :yhetil-remote:
    Near :yhetil-local:
    Patterns yhetil/emacs/devel* yhetil/emacs/user* yhetil/emacs/tangents*
    Create Near
    Expunge Near
    SyncState *
    Sync Pull

    IMAPAccount proton
    Host 127.0.0.1
    Port 1143
    User kuba@kubajecminek.cz
    PassCmd "gpg2 -q --for-your-eyes-only --no-tty -d ~/.password-store/proton:1143.gpg"
    SSLType STARTTLS
    # Copy cert info to ~/.config/protonmail/cert.pem
    # $ openssl s_client -starttls imap -connect 127.0.0.1:1143 -showcerts
    CertificateFile ~/.config/protonmail/cert.pem

    IMAPStore proton-remote
    Account proton

    MaildirStore proton-local
    Subfolders Verbatim
    Path /data/Mail/proton/
    Inbox /data/Mail/proton/Inbox

    Channel proton
    Far :proton-remote:
    Near :proton-local:
    Patterns * !Labels*
    Create Near
    Expunge Near
    SyncState *
    Sync Pull
  '';
}
