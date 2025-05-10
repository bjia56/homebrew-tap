class Cosmotop < Formula
  desc "Multiplatform system monitoring tool using Cosmopolitan Libc"
  homepage "https://github.com/bjia56/cosmotop"
  version "0.7.1"
  url "https://github.com/bjia56/cosmotop/releases/download/v#{version}/cosmotop.exe"
  sha256 "1f533b1de706ff0f00edbc73787fd8a3cda8aa38ce269860e4abf146b8850c02"
  license "Apache-2.0"

  def install
    libexec.install "cosmotop.exe"
    launcher = <<~EOS
      #!/bin/bash
      chmod +x "#{prefix}/libexec/cosmotop.exe" >/dev/null 2>&1
      exec "#{prefix}/libexec/cosmotop.exe" "$@"
    EOS
    (bin/"cosmotop").write launcher
    (bin/"cosmotop.exe").write launcher
  end
end
