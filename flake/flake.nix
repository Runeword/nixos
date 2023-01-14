{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    # let
    #   system = "x86_64-linux";
    #   pkgs = import nixpkgs {
    #     inherit system;
    #     config = { allowUnfree = true; };
    #   };
    # in {
    #   defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    #   homeConfigurations = {
    #     charles = home-manager.lib.homeManagerConfiguration {
    #       inherit pkgs;
    #       modules = [ ./home.nix ];
    #     };
    #   };
    # };

     let 
       system = "x86_64-linux";
       # pkgs = import nixpkgs.legacyPackages.x86_64-linux {
       pkgs = import nixpkgs {
         config = { allowUnfree = true; };
         inherit system;
       };
     in {
       defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
       homeConfigurations = {
         charles = home-manager.lib.homeManagerConfiguration rec {
           inherit pkgs;
           modules = [
             ./home.nix
           ];
         };
       };
     };
}
