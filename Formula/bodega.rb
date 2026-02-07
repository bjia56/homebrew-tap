class Bodega < Formula
  desc "Git-native issue tracking for developers and AI agents"
  homepage "https://github.com/bjia56/bodega"
  version "v0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-x86_64"
      sha256 "7453783f58c3aba65eb8836f8cc897d0df8de9628889b2219874d40432934b82"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-macos-arm64"
      sha256 "3d337c1917fc420ff1a51834711ea7e2042550311b3845b2894ad549459a185a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-x86_64"
      sha256 "c925bdaa20807d85dd620c348681221627833e1dab2832db23264043882a08b4"
    else
      url "https://github.com/bjia56/bodega/releases/download/#{version}/bodega-linux-arm64"
      sha256 "b69cb77d63f36463df08b7494cb0498434bd33335732e9051fd48de319fbbddf"
    end
  end

  def install
    bin.install Dir["bodega-*"].first => "bodega"
    chmod 0755, bin/"bodega"
  end
end
