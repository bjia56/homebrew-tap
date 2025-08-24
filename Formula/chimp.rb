class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.8.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "7d78923451d5f96edc213e6daa57829f53139d6349e0a48ae982569bef35fcd5"
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
