class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "3dd9bc9120b7d770e00922208554b82121cea72ac27efdde8a76d40a3f5c18f0"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "b837202a76c3590a1a93cd9f9faf292ddafcefcb1c74886202d45814526875cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "a207a7800a81b3679cc1282726ca070682eb430a5d8e746311ee70823027a0ca"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "3cff6c84ec462e1323ce687b37a28bbfc91dcdaefbf8c714b0031a640db0a552"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
