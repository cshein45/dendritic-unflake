{ lib, self, ... }:
{

  modules.nixos.no-boot = {
    boot.loader.grub.enable = false;
    fileSystems."/".device = "/dev/no-device";
  };

  modules.nixos.installer =
    { modulesPath, ... }:
    {
      imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
    };

  modules.nixos.statics = {
    system.stateVersion = "25.11";
    nixpkgs.hostPlatform = "x86_64-linux";
    passthru = { };
  };

  nixosConfigurations.my-laptop = lib.nixosSystem {
    modules = with self.modules.nixos; [
      statics
      no-boot
      # installer
    ];
  };
}
