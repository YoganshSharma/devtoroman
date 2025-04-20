{
  description = "Devnagri to Roman";

  # Define the input for nixpkgs-unstable
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";  # Use the unstable version of nixpkgs
  };

  # Define the outputs for a specific system architecture (x86_64-linux)
  outputs = { self, nixpkgs, ... }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    # Only generate the package for x86_64-linux
    packages.x86_64-linux = {
      devtoroman = pkgs.python3Packages.buildPythonApplication {
        pname = "devtoroman";  # The name of the package
        version = "1.0.0";     # Version of the package
        src = ./.;  # Path to your script, '.' refers to the current directory

        installPhase = ''
          mkdir -p $out/bin
          cp devtoroman.py $out/bin/devtoroman
          chmod +x $out/bin/devtoroman
        '';
      };
    };

    # Define the default package for x86_64-linux
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.devtoroman;

    # Enable nix run for devtoroman
    apps.x86_64-linux.devtoroman = {
      type = "app";
      program = "${self.packages.x86_64-linux.devtoroman}/bin/devtoroman";
    };
          devShells.x86_64-linux = pkgs.mkShell {
        buildInputs = [
          pkgs.python3
          pkgs.python3Packages.setuptools
          # Include the built devtoroman CLI in PATH
          self.packages.x86_64-linux.devtoroman
        ];
        shellHook = ''
          echo "Entering dev shell for devtoroman"
          echo "Use 'devtoroman' to run the CLI"
        '';
      };

  };
}

