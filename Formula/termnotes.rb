class Termnotes < Formula
  desc "A note taker in your terminal"
  homepage "https://github.com/bjia56/termnotes"
  version "v0.3.0"
  url "https://github.com/bjia56/termnotes/releases/download/#{version}/termnotes.exe"
  sha256 "2b8bf25394cd85a161937248332918638084cea809b9485c67c99e4071df18d1"
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
