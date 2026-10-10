class Zrk < Formula
  desc "Constant-throughput HTTP load generator in Zig"
  homepage "https://zoxy.io/zrk"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zrk"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.0/zrk-3.0.0-aarch64-macos.tar.gz"
      sha256 "b3f52e85e179cb70dd9b1d2c4f4c6df2b18e883f45eb4479ce9044cb7f2835ba"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.0/zrk-3.0.0-x86_64-macos.tar.gz"
      sha256 "96da68ca88db7b1f13e6dff4b9b7485a185f2227026e2d33922e6ffb3f19215c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.0/zrk-3.0.0-aarch64-linux.tar.gz"
      sha256 "655a2036872bfc6f2514f1bfc9356d65bcd1a4dab5502cf3129b3d2cad1d9b77"
    end
    on_intel do
      url "https://github.com/zoxy-io/zrk/releases/download/v3.0.0/zrk-3.0.0-x86_64-linux.tar.gz"
      sha256 "33114a9ff44933767551c3fb71940d8861ce5f0502c04ffa1b734b98f98b1081"
    end
  end

  def install
    bin.install "zrk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zrk --version")
  end
end
