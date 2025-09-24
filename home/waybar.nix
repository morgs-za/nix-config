{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;  # Use Waybar from nixos-25.05
    settings = {
      leftBar = {
        layer = "top";
        position = "top";
        height = 48;  # Increased for slightly bigger bar
        width = 300;  # Fixed width for left bar
        spacing = 6;
        margin-top = 6;
        margin-bottom = 6;
        margin-left = 6;
        preferred-color-scheme = "dark";  # Force dark theme
        modules-left = [ "hyprland/workspaces" ];
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
      };
      centerBar = {
        layer = "top";
        position = "top";
        height = 48;  # Increased for slightly bigger bar
        width = 400;  # Fixed width for center bar
        spacing = 6;
        margin-top = 6;
        margin-bottom = 6;
        preferred-color-scheme = "dark";  # Force dark theme
        modules-center = [ "clock" ];
        clock = {
          format = "🕰 {:%Y-%m-%d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
      rightBar = {
        layer = "top";
        position = "top";
        height = 48;  # Increased for slightly bigger bar
        width = 600;  # Fixed width for right bar
        spacing = 6;
        margin-top = 6;
        margin-bottom = 6;
        margin-right = 6;
        preferred-color-scheme = "dark";  # Force dark theme
        modules-right = [ "cpu" "memory" "network" "pulseaudio" "tray" ];
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
          spacing = 12;
        };
      };
    };
    style = ''
      /* Catppuccin-Mocha theme */
      * {
        font-family: FiraCode Nerd Font, sans-serif;
        font-size: 18px; /* Increased for larger bar */
        border: none;
        border-radius: 10px;
        min-height: 0;
        padding: 0px 10px;
        margin: 0px 5px;
      }
      window#waybar.leftBar, window#waybar.centerBar, window#waybar.rightBar {
        background: transparent; /* Fully transparent bar */
        color: #cdd6f4; /* Mocha text */
      }
      window#waybar.centerBar {
        margin-left: auto;
        margin-right: auto;
      }
      window#waybar.rightBar {
        margin-left: auto;
      }
      #workspaces button {
        padding: 0px 12px;
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
