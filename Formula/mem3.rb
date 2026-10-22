class Mem3 < Formula
  desc "Memory store for agents, in one binary"
  homepage "https://github.com/chy3xyz/mem3"
  license "MIT"

  livecheck do
    url "https://github.com/chy3xyz/mem3"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chy3xyz/mem3/releases/download/v0.1.0-alpha/aarch64-macos.zip"
      sha256 "ac14ddeb1977ecbc70e130eda7f298984f72504227a4904e3b32060e932f82b0"
    end
    on_intel do
      url "https://github.com/chy3xyz/mem3/releases/download/v0.1.0-alpha/x86_64-macos.zip"
      sha256 "8b97982bd77fd3e9847c2bab952b710fc8199dc66d7343ba49af78b9813eb310"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/mem3/releases/download/v0.1.0-alpha/aarch64-linux-musl.tar.xz"
      sha256 "6849245b9aa03ceed2083d598950567cc4fa74b70495872680a2265f0505dfdf"
    end
    on_intel do
      url "https://github.com/chy3xyz/mem3/releases/download/v0.1.0-alpha/x86_64-linux-musl.tar.xz"
      sha256 "7ae7234da410fa7a8095515aa347db5723ce89aa91095288b03e1a72b2acf362"
    end
  end

  def install
    bin.install "mem3"
  end

  test do
    assert_match "0.1.0-alpha", shell_output("#{bin}/mem3 version 2>&1")
  end
end
