{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;  # Use Waybar from nixos-25.05
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "network" "pulseaudio" "tray" ];
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M}";
        };
        cpu = {
          format = "CPU {usage}%";
        };
        memory = {
          format = "Mem {used}/{total} GiB";
        };
        network = {
          format-ethernet = "Eth {ipaddr}";
          format-disconnected = "Disconnected";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "Muted {icon}";
          format-icons = {
            default = [ "🔊" ];
          };
          on-click = "pavucontrol";
        };
      };
    };
    style = ''
      /* Catppuccin-Mocha theme */
      * {
        font-family: FiraCode Nerd Font, sans-serif;
        font-size: 14px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }
      window#waybar {
        background: #1e1e2e; /* Mocha base */
        color: #cdd6f4; /* Mocha text */
      }
      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: #cdd6f4;
      }
      #workspaces button:hover {
        background: #585b70; /* Mocha overlay0 */
      }
      #workspaces button.active {
        background: #89b4fa; /* Mocha blue */
        color: #1e1e2e;
      }
      #clock, #cpu, #memory, #network, #pulseaudio, #tray {
        padding: 0 10px;
        background: #313244; /* Mocha surface0 */
      }
      #pulseaudio.muted {
        color: #f38ba8; /* Mocha red */
      }
    '';
  };

  # Ensure FiraCode Nerd Font is available
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
