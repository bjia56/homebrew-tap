class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.7.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "9c4a455bbe6b823b770f8eb0659efb6ef1fc7d96743b499b225dd530f4039554"
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
