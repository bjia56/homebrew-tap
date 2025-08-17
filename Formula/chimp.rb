class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.7.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "0d5da0eaf1d6e1569cd8a1e40f11e07051b8635533741f10fa019ac9c112d0fe"
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
