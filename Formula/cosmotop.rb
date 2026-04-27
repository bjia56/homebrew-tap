class Cosmotop < Formula
  desc "Multiplatform system monitoring tool using Cosmopolitan Libc"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.15.0"
  url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
  sha256 "b8229ac39bfaa42d208dae665401b57713f83c633c2a7df5ee01c409e924ea36"
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
