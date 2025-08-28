class Cosmotop < Formula
  desc "Multiplatform system monitoring tool using Cosmopolitan Libc"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.13.0"
  url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
  sha256 "dd000ddefaedae7b33f20f05a0bd8c9c09def7fc483ff52294d32ecf4e4ac866"
  license "Apache-2.0"

  def install
    libexec.install "cosmotop"
    launcher = <<~EOS
      #!/bin/bash
      chmod +x "#{prefix}/libexec/cosmotop" >/dev/null 2>&1
      exec sh "#{prefix}/libexec/cosmotop" "$@"
    EOS
    (bin/"cosmotop").write launcher
  end
end
