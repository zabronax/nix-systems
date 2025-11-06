{ config, lib, ... }:
{
  options.wsl.cursorInterop.enable = lib.mkEnableOption "Enable WSL Cursor bash wrapping";

  config = lib.mkIf config.wsl.cursorInterop.enable {
    wsl = {
      wrapBinSh = true;

      extraBin = [
        {
          name = "bash";
          src = config.wsl.binShExe;
        }
      ];
    };
  };
}
