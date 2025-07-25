class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.6.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "79da1b1c1400a3d0d9e256935a32fa987f284b8e018576268fd7a252c12ec9ca"
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
