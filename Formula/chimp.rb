class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.10.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "20e63399b09cc0fbffd63a9fe20e4f956b8d9d7fd6d758f32f2672e1b22c3adf"
  license "MIT"

  def install
    libexec.install "chimplink"
    launcher = <<~EOS
      #!/bin/bash
      chmod +x "#{prefix}/libexec/chimplink" >/dev/null 2>&1
      exec sh "#{prefix}/libexec/chimplink" "$@"
    EOS
    (bin/"chimplink").write launcher
  end
end
