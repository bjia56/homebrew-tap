class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.8.0"
  url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega"
  sha256 "55318d50c16b15e260ca2d2ca2571af25e5c4bd7b4e4250dd9492232bda3afd9"
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
