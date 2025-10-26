class Termnotes < Formula
  desc "A note taker in your terminal"
  homepage "https://github.com/bjia56/termnotes"
  version "v0.1.2"
  url "https://github.com/bjia56/termnotes/releases/download/#{version}/termnotes.exe"
  sha256 "aa4609aae9a143baedf3308b17ed73cc8270fcc425d46d522f72cdf223f82e6b"
  license "MIT"

  def install
    libexec.install "termnotes.exe"
    launcher = <<~EOS
      #!/bin/bash
      chmod +x "#{prefix}/libexec/termnotes.exe" >/dev/null 2>&1
      exec sh "#{prefix}/libexec/termnotes.exe" "$@"
    EOS
    (bin/"termnotes").write launcher
  end
end
