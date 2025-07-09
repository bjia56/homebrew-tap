class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.4.1"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "338be02a3cc7e7f15c1b2f3859042489036ff34bf43881bd34f81cdcd83644f9"
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
