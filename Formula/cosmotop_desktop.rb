class CosmotopDesktop < Formula
  desc "Desktop launcher for the Cosmotop TUI system monitor"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.14.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/bjia56/cosmotop/archive/refs/tags/#{version}.tar.gz"
    sha256 "placeholder_macos_source"

    depends_on "go" => :build
    depends_on "node" => :build
    depends_on "wails" => :build

    resource "cosmotop-runtime" do
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
      sha256 "placeholder_cosmotop_runtime"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-amd64"
      sha256 "placeholder_linux_amd64"
    else
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-arm64"
      sha256 "placeholder_linux_arm64"
    end
  end

  def install
    if OS.mac?
      bundle_data = buildpath/"desktop/internal/bundle/data"
      bundle_data.mkpath
      resource("cosmotop-runtime").stage { cp "cosmotop", bundle_data }
      chmod 0755, bundle_data/"cosmotop"

      cd "desktop" do
        system "wails", "build", "-clean", "-platform", "darwin/universal"
        prefix.install "build/bin/cosmotop-desktop.app"
      end

      (bin/"cosmotop-desktop").write <<~EOS
        #!/bin/bash
        exec "#{prefix}/cosmotop-desktop.app/Contents/MacOS/cosmotop-desktop" "$@"
      EOS
    else
      bin.install Dir["cosmotop-desktop-linux-*"].first => "cosmotop-desktop"
      chmod 0755, bin/"cosmotop-desktop"
    end
  end

  test do
    assert_predicate bin/"cosmotop-desktop", :executable?
  end
end
