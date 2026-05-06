class CosmotopDesktop < Formula
  desc "Desktop launcher for the Cosmotop TUI system monitor"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.15.1"
  license "Apache-2.0"

  COSMOTOP_RUNTIME_SHA256 = "2d72716c67adbe18c058eeb6f04e44bfb7bfdec1089df4cd1a3ad3ff989b5184"

  on_macos do
    url "https://github.com/bjia56/cosmotop/archive/refs/tags/#{version}.tar.gz"
    sha256 "b27aa70799ddd7a1359c1769e2b8aa46a2fa298bc32410bddf2683c2c0279aa2"

    depends_on "go" => :build
    depends_on "node" => :build
    depends_on "wails" => :build
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-x86_64"
      sha256 "5ffd780fc279ed08333c7ac8837ac814fd32b5a13d50f869d2eecaf7c070ce26"
    else
      url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop-desktop-linux-aarch64"
      sha256 "82b2d71a4a706ccf095604a669180fd48651a0e0f41f4acc4582582bcfb88733"
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
