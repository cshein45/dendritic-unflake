{ lib, ... }:
{
  options.nixosConfigurations = lib.mkOption {
    description = "NixOS configurations";
    default = { };
    type = lib.types.attrsOf lib.types.anything;
  };
}
