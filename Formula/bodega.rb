class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "fb6f15742f4c2bc4da1a878eb7da6c6aee1039be2d47a3f31784d82f09598afd"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "fb81fbfb7be9cddeb0a2ac825b3f7cc348994f488a312a2f2513ea430c5a6647"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "db2ba6564d10a29c92a5b9f1f49affa1fe1a151ee38faad909dfba89c5d7eb70"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "89bf605ed471653fb8fa0c4fec34eb832ece6e2a85036825ba36fcaf377ee48e"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
