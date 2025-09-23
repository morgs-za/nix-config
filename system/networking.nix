{ ... }:

{
  networking.hostName = "morgan-desktop";
  networking.networkmanager.enable = true;
  #networking.useDHCP = true;  # Enable DHCP for wired Ethernet

  time.timeZone = "Africa/Johannesburg";

  i18n.defaultLocale = "en_ZA.UTF-8";

  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };
}
