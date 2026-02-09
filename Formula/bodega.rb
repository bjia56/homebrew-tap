class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "33785c844aa11b04faae79394b95f757f7d379b5d597abfe035a4352d4f276ae"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "5f88c7220d50ad1a0682e52b6fa96a1df6aec54883e097e8f444eb3b9c757ec2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "7d65f065cc955e10ea1da14298316b4e25b6ccbfb33b0ebc2c82fd76d8958e01"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "de126d114cb55f63986f2ab7426a5a90aeded7a3de38515244efc28e334c2fd0"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
