# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    x86_64-linux = "14lla43qz6qa9qsygga9ixq5qm4hw8q7v8ww7ycbmxmq7y4cz8b7";
    aarch64-linux = "0l7a4bha4y6zfxp1i0w6iiwbdyjl4wyrn4qmc3i3nvw3mjsszhvm";
    x86_64-darwin = "018f3qnw98bjbl1zq47ffg51rxyb54gwf1f5lyz35bkzrxhm9x36";
    aarch64-darwin = "0071c9anxgdc8hxdf4873yc3sm8sbqx3lhb5q9sw77pcamkq9qbf";
  };

  urlMap = {
    x86_64-linux = "https://github.com/AppleGamer22/stalk/releases/download/v1.0.7/stalk_1.0.7_linux_amd64.tar.gz";
    aarch64-linux = "https://github.com/AppleGamer22/stalk/releases/download/v1.0.7/stalk_1.0.7_linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/AppleGamer22/stalk/releases/download/v1.0.7/stalk_1.0.7_mac_amd64.tar.gz";
    aarch64-darwin = "https://github.com/AppleGamer22/stalk/releases/download/v1.0.7/stalk_1.0.7_mac_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "stalk";
  version = "1.0.7";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./stalk $out/bin/stalk
    installManPage ./stalk.1
    installShellCompletion ./stalk.*sh
  '';

  system = system;

  meta = {
    description = "Cross-platform file watcher.";
    homepage = "https://github.com/AppleGamer22/stalk";
    license = lib.licenses.gpl3Only;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
