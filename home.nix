{ config, pkgs, ...}:
{
   home.username = "neo";

   home.packages = with pkgs; [
   dwl
   dwlb
   wbg
   wlrctl
   newsboat
   hugo
   wmenu
   picard
   ];

   nixpkgs.overlays = [ ( final: prev: { dwl = prev.dwl.overrideAttrs { patches = [ ./dwl-patches/autostart.patch ]; }; }) ];
   
   programs.home-manager.enable = true;
   home.stateVersion = "24.11";
}
