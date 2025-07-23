class Cosmotop < Formula
  desc "Multiplatform system monitoring tool using Cosmopolitan Libc"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.11.0"
  url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
  sha256 "27d951f8efef2f0f9f95fb3b2bac2f69d5778189f473e37b16ea81ae31c7818c"
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
