{ config, lib, ... }:

with lib;

{
  meta.maintainers = with maintainers; [
    julienmalka
    camillemndn
  ];

  options.virtualisation.proxmox = (import ./options.nix { inherit config lib; }).options // {
    node = mkOption {
      type = types.str;
      description = "The cluster node name.";
    };

    name = mkOption {
      type = types.str;
      default = config.networking.hostName;
      description = "Set a name for the VM. Only used on the configuration web interface.";
    };

    autoInstall = mkEnableOption "Automatically install the NixOS configuration on the VM";
  };
}
