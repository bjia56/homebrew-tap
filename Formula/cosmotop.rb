class Cosmotop < Formula
  desc "Multiplatform system monitoring tool using Cosmopolitan Libc"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.14.0"
  url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
  sha256 "dad55b4d8f85f20f645a49d536bfb3541fa530817110632b5f2548150cc058d2"
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
