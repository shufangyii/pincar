{pkgs}: {
  channel = "stable-24.05";
  packages = [
    pkgs.nodejs_latest
    pkgs.pnpm
  ];
  idx.extensions = [
    "vue.volar"
    "dbaeumer.vscode-eslint"
    "EditorConfig.EditorConfig"
    "esbenp.prettier-vscode"
    "vitest.explorer"
  ];
  idx.previews = {
    previews = {
      web = {
        command = [
          "pnpm"
          "dev"
          "--"
          "--port"
          "$PORT"
          "--host"
          "0.0.0.0"
        ];
        manager = "web";
      };
    };
  };
}