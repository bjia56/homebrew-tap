class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "d23a7f0ed967a4c5e42cdcbc76a90d6ae635ae65e88cdd247015aa037efddf0a"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "b19910fb3ea00e11ca1b5602370a7169a257050a1a2175ead32ffdc4abb37635"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "5cfd4a8b809553468ef6168b29a6b25f45714c79ced4471b1f4db16dd89b9706"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "bd35ae476a1bef9eee34510a3389fa04246b65c0cfb4aa020c1c224b403a39c0"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
