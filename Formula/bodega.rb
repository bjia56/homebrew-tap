class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.9.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "8431eac363fb7a1234b694454850f9980991c3b25e38d9e3fd5a0ee10470dacb"
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
