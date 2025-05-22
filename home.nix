{ config, pkgs, pkgs-stable, ...}:
{
   home.username = "neo";

   home.packages = with pkgs; [

   # wm
   dwl
   dwlb
   wbg
   wmenu
   
   #audio 
   pavucontrol
   alsa-utils
   audacious

   #music
   mpd
   mpc
   ncmpcpp
   picard
   nicotine-plus

   # cli tools
   wlrctl
   newsboat
   hugo
   unzip
   sxiv
   htop
   libnotify
   nmap
   mpv

   # terminal emulator
   foot 

   # GUI
   monero-gui
   vesktop
   gajim
   keepassxc
   syncthing
   hexchat

   # studying
   pomodoro-gtk
   zathura
   anki
   timeline
   libreoffice

   # browers
   firefox
   ungoogled-chromium

   # audio/image/text manipulation
   imagemagick
   ffmpeg
   pandoc
   krita

   # lisp
   emacs
   sbcl

   # games
   gzdoom
   libresprite
   minetest

   # typesetting
   texliveFull

   #wine
   wineWowPackages.waylandFull
   winetricks

   ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    
    profileExtra = ''
    [ -z $(echo $DISPLAY) ] && mpd && dwl -s 'dwlb'
    '';
    
    shellAliases = {
       ncm = "ncmpcpp";
       nb = "newsboat";
    };
  };

    #programs.vscode = {
    #  enable = true;
    #  package = pkgs-stable.vscodium;
    #};

   nixpkgs.overlays = [ ( final: prev: { dwl = prev.dwl.overrideAttrs { patches = [ ./dwl-patches/autostart.patch ]; }; }) ];

   nixpkgs.config.allowUnfree = true; 
   programs.home-manager.enable = true;
   home.stateVersion = "24.11";
}
