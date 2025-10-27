class Termnotes < Formula
  desc "A note taker in your terminal"
  homepage "https://github.com/bjia56/termnotes"
  version "v0.2.0"
  url "https://github.com/bjia56/termnotes/releases/download/#{version}/termnotes.exe"
  sha256 "6abae6e1a24cbea9708f83ca5e9065c02e4a76ba1c8794c1908740b11e5bd6a1"
  license "MIT"

  def install
    libexec.install "termnotes.exe"
    launcher = <<~EOS
      #!/bin/bash
      chmod +x "#{prefix}/libexec/termnotes.exe" >/dev/null 2>&1
      exec sh "#{prefix}/libexec/termnotes.exe" "$@"
    EOS
    (bin/"termnotes").write launcher
  end
end
