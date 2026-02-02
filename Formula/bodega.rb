class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.5.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "632fa0a11f3833e5ac7ae4b647651b3790b00d65e85a6dcf5abfc95b7cb5b0e6"
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
