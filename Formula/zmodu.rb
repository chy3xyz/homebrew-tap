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
      sha256 "0c146610d5932a1347beaaaf71224cdb86b3c1d8a2f4440f60220db2af18a58b"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-macos.tar.gz"
      sha256 "0ea72304fc480f2aa8d2a39f657bb4e9ef421c57edbd11a7e9884a29ec6d113c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-linux.tar.gz"
      sha256 "fc551498b8dd4a011d4f03ed35382cdad9563eabd2758c61eacc5ba0879b1443"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-linux.tar.gz"
      sha256 "aa446dea1a687459d781ead525d1b5548750472c13067d7d29f39c9c47547934"
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
