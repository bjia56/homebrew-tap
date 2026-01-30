class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.1.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "a58387d7c46a493f20653dc98e9081c9753e54d6820453056e62d251d7e99c89"
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
