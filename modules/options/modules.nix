{ lib, ... }:
{
  options.modules = lib.mkOption {
    description = "<class>.<aspect> modules. equivalent to flake-parts' flake.modules";
    default = { };
    type = lib.types.attrsOf (lib.types.attrsOf lib.types.deferredModule);
  };
}
