{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.cage}/bin/cage -s ${pkgs.greetd.gtkgreet}/bin/gtkgreet";
        user = "morgs";
      };
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "morgs";
      };
    };
  };

  # Ensure Wayland environment variables for gtkgreet
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "vulkan";
  };
}
