class Cosmotop < Formula
  desc "Multiplatform system monitoring tool using Cosmopolitan Libc"
  homepage "https://github.com/bjia56/cosmotop"
  version "v0.8.0"
  url "https://github.com/bjia56/cosmotop/releases/download/#{version}/cosmotop"
  sha256 "9bd8d7720a0bf8b0085da65f05ea8419bb79b4987549d21779a0c65a8a568813"
  license "Apache-2.0"

  def install
    bin.install "cosmotop"
  end
end
