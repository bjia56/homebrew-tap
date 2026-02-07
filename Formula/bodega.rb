class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "INTEL_MAC_SHA256_PLACEHOLDER"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "ARM_MAC_SHA256_PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "INTEL_LINUX_SHA256_PLACEHOLDER"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "ARM_LINUX_SHA256_PLACEHOLDER"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
