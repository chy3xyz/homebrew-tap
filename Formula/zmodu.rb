class Zmodu < Formula
  desc "Compile-time modular application framework and runtime for Zig (CLI)"
  homepage "https://github.com/chy3xyz/zmodu"
  version "0.42.0"
  license "MIT"

  livecheck do
    url "https://github.com/chy3xyz/zmodu"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-macos.tar.gz"
      sha256 "bf3dd6e8bbc684ae25c42809f7ec4a96659792af2beec6c085bb9e74ecfcc077"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-macos.tar.gz"
      sha256 "81ad1f2b30bbf908f7b5bdb3f20cfabf15d678b05971c613cd395272d00adc3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-linux.tar.gz"
      sha256 "a42f0a0ae72de54ce35ee1746634fe7f9c2034f536072667bced36ead2ece325"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-linux.tar.gz"
      sha256 "230bc87c149c460ebdaf01d6ee1f442f5f451ee8cc3fbf4e56005011dc9e8d22"
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
