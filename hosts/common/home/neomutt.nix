{config, ...}: {
  programs.neomutt = {
    enable = true;
  };

  xdg.configFile."mutt/muttrc".text = ''
    #                  _   _
    #  _ __ ___  _   _| |_| |_ _ __ ___
    # | '_ ` _ \| | | | __| __| '__/ __|
    # | | | | | | |_| | |_| |_| | | (__
    # |_| |_| |_|\__,_|\__|\__|_|  \___|

    set folder = "imap://127.0.0.1:1143"
    set imap_user = "kuba@kubajecminek.cz"

    set smtp_url = "smtp://kuba@kubajecminek.cz@127.0.0.1:1025"

    set spoolfile = "+INBOX"
    set record = "+Sent"
    set trash = "+Trash"
    set postponed = "+Drafts"

    mailboxes =INBOX =Sent =Trash =Drafts =Spam =Archive =Folders/emacs-devel

    set from = "kuba@kubajecminek.cz"
    set realname = "Jakub Ječmínek"
    set signature = "echo 'Jakub Ječmínek\n<https://kubajecminek.cz>'|"
    set use_from = yes

    set editor = vim
    set user_agent = yes
    set edit_headers = yes
    set charset = UTF-8
    unset use_domain
    # set text_flowed = yes

    set header_cache = ~/.cache/mutt

    set imap_keepalive = 300
    set mail_check = 120

    set sort_aux=last-date-received
    set sort=threads
    set sort_re
    set quit = no

    set date_format="%d.%m.%y %T"
    set index_format="%2C | %Z [%d] %-30.30F (%-4.4c) %s"

    set attribution="%n wrote:"

    # Colors
    #color normal default default
    color hdrdefault red default
    color quoted brightblue default
    color signature red default
    color indicator brightyellow red
    color error brightred default
    color status yellow blue
    color tree magenta default     # the thread tree in the index menu
    color tilde magenta default
    color message brightcyan default
    color markers brightcyan default
    color attachment brightmagenta default
    color search default green     # how to hilite search patterns in the pager

    color header brightred default ^(From|Subject):
    color body magenta default "(ftp|http)://[^ ]+"        # point out URLs
    color body magenta default [-a-z_0-9.]+@[-a-z_0-9.]+   # e-mail addresses
    color underline brightgreen default

    mono quoted bold
  '';
}
