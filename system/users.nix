{ ... }:

{
  users.users.morgs = {
    isNormalUser = true;
    description = "Morgs";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
