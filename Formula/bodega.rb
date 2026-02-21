class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "12661eaa8ea5ed809f157a7f6be7f5986d33cb844cc90319e44d5e03cc7c2ac4"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "46aebd7755440097ce19e575a63cb0fef42e119168f725c92a655eb30af0915e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "8833aff04b6dc03a18d400e63f2a44f86dde9462b6665e4cb3f3646879ab8a1d"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "b47589f88e197837118b8153bd626c3c76968aa9054e5eb9d2d38313e98f65a8"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
