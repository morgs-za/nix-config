{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;  # Use Waybar from nixos-25.05
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;  # Increased from 34
        spacing = 6;  # Increased from 4
        margin-top = 6;  # Increased from 4
        margin-bottom = 6;  # Increased from 4
        margin-left = 6;  # Increased from 4
        margin-right = 6;  # Increased from 4
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "network" "pulseaudio" "tray" ];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
          on-click = "activate";
        };
        clock = {
          format = "🕰 {:%Y-%m-%d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          format = "🖥 {usage}%";
          tooltip = true;
        };
        memory = {
          format = "🧠 {used}/{total} GiB";
          tooltip = true;
        };
        network = {
          format-ethernet = "🌐 {ipaddr}";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "Network: {ifname}";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "🔇 Muted";
          format-icons = {
            default = [ "🔊" ];
          };
          on-click = "pavucontrol";
          tooltip = true;
        };
        tray = {
          spacing = 12;  # Increased from 10
        };
      };
    };
    style = ''
      /* Catppuccin-Mocha theme */
      * {
        font-family: FiraCode Nerd Font, sans-serif;
        font-size: 16px; /* Increased from 14px */
        border: none;
        border-radius: 10px; /* Increased from 8px */
        min-height: 0;
        padding: 0 10px; /* Adjusted for larger size */
        margin: 0 5px; /* Adjusted for larger size */
        transition: all 0.2s ease-in-out;
      }
      window#waybar {
        background: rgba(30, 30, 46, 0.6); /* More transparent (was 0.8) */
        color: #cdd6f4; /* Mocha text */
        border-radius: 14px; /* Increased from 12px */
        border: 1px solid #45475a; /* Mocha surface1 */
      }
      #workspaces button {
        padding: 0 12px; /* Adjusted for larger size */
        background: #313244; /* Mocha surface0 */
        color: #cdd6f4; /* Mocha text */
        border-radius: 10px;
      }
      #workspaces button:hover {
        background: #585b70; /* Mocha overlay0 */
        color: #f5e0dc; /* Mocha rosewater */
      }
      #workspaces button.active {
        background: #89b4fa; /* Mocha blue */
        color: #1e1e2e; /* Mocha base */
        border: 1px solid #b4befe; /* Mocha lavender */
      }
      #clock {
        background: #313244; /* Mocha surface0 */
        color: #94e2d5; /* Mocha teal */
        font-weight: bold;
      }
      #cpu, #memory, #network, #pulseaudio, #tray {
        background: #313244; /* Mocha surface0 */
        color: #cdd6f4; /* Mocha text */
      }
      #cpu:hover, #memory:hover, #network:hover, #pulseaudio:hover {
        background: #585b70; /* Mocha overlay0 */
        color: #f5e0dc; /* Mocha rosewater */
      }
      #pulseaudio.muted {
        background: #f38ba8; /* Mocha red */
        color: #1e1e2e; /* Mocha base */
      }
      #tray > .passive {
        color: #6c7086; /* Mocha overlay2 */
      }
      #tray > .active {
        color: #89b4fa; /* Mocha blue */
      }
      tooltip {
        background: #1e1e2e; /* Mocha base */
        border: 1px solid #45475a; /* Mocha surface1 */
        border-radius: 10px;
        color: #cdd6f4; /* Mocha text */
      }
    '';
  };

  # Ensure FiraCode Nerd Font is available
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
