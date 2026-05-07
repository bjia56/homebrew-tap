class CosmotopDesktop < Formula
  desc "Desktop launcher for the Cosmotop TUI system monitor"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.15.2"
  license "Apache-2.0"

  COSMOTOP_RUNTIME_SHA256 = "3de8b2ac54d7cbce90ccfeb66ffceded10344db1ccf74a5593b46b6bf3537c17"

  on_macos do
    url "https://github.com/bjia56/cosmotop/archive/refs/tags/#{version}.tar.gz"
    sha256 "38dc6c98eb8408b8daae7bd15ac6cf379d4c0a3a4b0aba57081a08bd87066489"

    depends_on "go" => :build
    depends_on "node" => :build
    depends_on "wails" => :build
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-x86_64"
      sha256 "2e2c0054e9ab7f44acf502482fb1f1839d718e2be20dad08031cc7d971a52ca4"
    else
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-aarch64"
      sha256 "81f71b3c7418bfb37f6449986a4ee0bbe2193fe6957ce374866c97b6ea0bd4b3"
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
