class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.10.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "e486c2b6718ccf1bd9bd7069450e7dc470f7a35584ca3d7f382e4fb53f442dae"
  license "MIT"

  def install
    libexec.install "bodega"
    launcher = <<~EOS
      #!/bin/bash
      chmod +x "#{prefix}/libexec/bodega" >/dev/null 2>&1
      exec sh "#{prefix}/libexec/bodega" "$@"
    EOS
    (bin/"bodega").write launcher
  end
end
