class CosmotopDesktop < Formula
  desc "Desktop launcher for the Cosmotop TUI system monitor"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.15.0"
  license "Apache-2.0"

  COSMOTOP_RUNTIME_SHA256 = "b8229ac39bfaa42d208dae665401b57713f83c633c2a7df5ee01c409e924ea36"

  on_macos do
    url "https://github.com/bjia56/cosmotop/archive/refs/tags/#{version}.tar.gz"
    sha256 "5e7dc771824bb630333e3b5b9e099823291cf0d480a9bc309d5a656a2a66e136"

    depends_on "go" => :build
    depends_on "node" => :build
    depends_on "wails" => :build
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-x86_64"
      sha256 "4d2c8ab76627c1a710855e8eb45d9f70eb2dd59a2b5ef445fc0573286f57d31a"
    else
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-aarch64"
      sha256 "15bf2946e0e3723f2f74d11721adc2f861b2c4c07856e3e9c5e1d4a7f927eec3"
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
