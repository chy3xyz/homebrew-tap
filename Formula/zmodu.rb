class Zmodu < Formula
  desc "Compile-time modular application framework and runtime for Zig (CLI)"
  homepage "https://github.com/chy3xyz/zmodu"
  version "0.43.7"
  license "MIT"

  livecheck do
    url "https://github.com/chy3xyz/zmodu"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-macos.tar.gz"
      sha256 "f619e01bcf02a81ca9b02dcafe9a6ab7c0be94e4a9c79789ad87450ea5f5eb2f"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-macos.tar.gz"
      sha256 "e48b9234edb2c373d82f6e45157edefb937ea9ee250dff55a1553042f9b47d8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-linux.tar.gz"
      sha256 "b6b5ac1f7e7ef00e15a118269292b676c6f6fca0d80a76a5903a4bcf10221cc6"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-linux.tar.gz"
      sha256 "fa2db9d7cb36a04de7e1f715759e0cddd8d26d4b4dc516770fb09ec92d1c9786"
    end
  end

  def install
    bin.install "zmodu"
  end

  test do
    # `zmodu --version` logs to stderr; capture both streams.
    assert_match version.to_s, shell_output("#{bin}/zmodu --version 2>&1")
    assert_match "Usage", shell_output("#{bin}/zmodu 2>&1")
  end
end
