{ config, pkgs, ...}:
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
   hydrus

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

   # lisp
   emacs
   sbcl

   # games
   gzdoom
   minetest

   # typesetting
   texliveFull

   ];

   nixpkgs.overlays = [ ( final: prev: { dwl = prev.dwl.overrideAttrs { patches = [ ./dwl-patches/autostart.patch ]; }; }) ];
   nixpkgs.config.allowUnfree = true; 
   programs.home-manager.enable = true;
   home.stateVersion = "24.11";
}
