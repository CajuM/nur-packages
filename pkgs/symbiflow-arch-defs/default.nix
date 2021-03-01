{ pkgs
, lib
, devices }:

let
  buildNum = "142";
  buildDate = "20210203-000107";
  commit = "4f62d7ae";

  bin = pkgs.callPackage ./bin.nix {
    inherit buildNum buildDate commit;
    sha256 = "0xldq018a16knribc2y01d8sw5xdancmqzdrzpx8zp7x32m10ryh";
  }; 

  devicePkgs = {
    "xc7a50t" = pkgs.callPackage ./mkdevice.nix {
      inherit buildNum buildDate commit;
      device  = "xc7a50t";
      sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
    };
    "xc7a100t" = pkgs.callPackage ./mkdevice.nix {
      inherit buildNum buildDate commit;
      device = "xc7a100t";
      sha256 = "00nkrw69r7i5xalvqn03v2j8sc5cabsxr34zj5yjhhnlklv1j6jk";
    };
    "xc7a200t" = pkgs.callPackage {
      inherit buildNum buildDate commit;
      device = "xc7a200t";
      sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
    };
    "xc7z010" = pkgs.callPackage {
      inherit buildNum buildDate commit;
      device = "xc7z010";
      sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
    };
    "xc7z020" = pkgs.callPackage {
      inherit buildNum buildDate commit;
      device = "xc7z020";
      sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
    };
  };
  
  devices_ = (with lib.attrsets; attrVals devices devicePkgs);

in

pkgs.callPackage ./wrapper.nix {
  inherit buildDate commit bin;
  devices = devices_;
}
