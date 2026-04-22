class CosmotopDesktop < Formula
  desc "Desktop launcher for the Cosmotop TUI system monitor"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.15.0b1"
  license "Apache-2.0"

  COSMOTOP_RUNTIME_SHA256 = "3f85f479432efaff2b59861df04ba2ce523833a9d07e4b1da38a814831077243"

  on_macos do
    url "https://github.com/bjia56/cosmotop/archive/refs/tags/#{version}.tar.gz"
    sha256 "a3ca1e2f8eff4920288546bf49fa21389cde33280a064af6929f0a282f9dec7e"

    depends_on "go" => :build
    depends_on "node" => :build
    depends_on "wails" => :build
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-amd64"
      sha256 "8f744209281e30a22700a7a1c481b244135d95ea00989eae3580661fb746a96b"
    else
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-arm64"
      sha256 "a21f2480b7a0329c0c87c3ef08c9e295dca38767f9b089783efc822e4cea7f14"
    end
  end

  def install
    if OS.mac?
      bundle_data = buildpath/"desktop/internal/bundle/data"
      bundle_data.mkpath
      runtime = bundle_data/"cosmotop"
      system "curl", "-L", "-o", runtime,
             "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
      actual = runtime.sha256
      expected = COSMOTOP_RUNTIME_SHA256
      raise "cosmotop runtime SHA256 mismatch: expected #{expected}, got #{actual}" if actual != expected

      chmod 0755, runtime

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
