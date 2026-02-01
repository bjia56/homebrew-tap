class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.12.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "7094746c6dfb78b34098c61a271b2aab1fd5319784d15c248022bb13c2ac1ef5"
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
