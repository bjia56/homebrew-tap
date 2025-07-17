class Chimp < Formula
  desc "Cross-platform Hybrid Interpreted Meta-Program"
  homepage "https://github.com/bjia56/chimp"
  version "v0.5.0"
  url "https://github.com/bjia56/chimp/releases/download/#{version}/chimplink"
  sha256 "5713ef58083ba04c0a8ba6d7bb74f83e301697cb290991b007016554cb491519"
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
