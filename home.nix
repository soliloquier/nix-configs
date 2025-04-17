{ config, pkgs, ...}:
{
   home.username = "neo";
   home.homeDirectory = "/home/neo/";

   home.packages = with pkgs; [
   dwl
   wlrctl
   newsboat
   hugo
   wmenu
   picard
   ];

   nixpkgs.overlays = [ ( final: prev: { dwl = prev.dwl.overrideAttrs { patches = [ ./dwl-patches/autostart.patch ]; }; }) ];
   
   programs.neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;
      configure = {
      customRC = ''
         set nu
	 colorscheme elflord
      '';
      };
   };

   programs.home-manager.enable = true;
}
