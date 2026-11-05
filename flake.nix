{
  inputs = {
    nixpkgs.url = "github:NixOS/Nixpkgs/nixos-unstable";
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.uv
        ];
        SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
      };

    };
}
