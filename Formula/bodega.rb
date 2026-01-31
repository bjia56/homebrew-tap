class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.2.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "d7ad2bc0070325d39bd2c35c85eba494ae54b6f9549a14c8dbe8ca1dea2aef7f"
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
