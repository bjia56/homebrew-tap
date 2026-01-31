class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.11.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "c0af3ebfee383b9ec0f3d60ed76cb111414dfb021b39760fb23b2831b09745a9"
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
