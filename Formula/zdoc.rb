class Zdoc < Formula
  desc "Documentation website generator for a folder of Markdown"
  homepage "https://github.com/chy3xyz/zdoc"
  license "MIT"

  livecheck do
    url "https://github.com/chy3xyz/zdoc"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.17.0/aarch64-macos.zip"
      sha256 "48c1a79924020f50d5ce5dd62cc710ccc74ad959e95a31cb6e624c7bd1a5806a"
    end
    on_intel do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.17.0/x86_64-macos.zip"
      sha256 "81a63dd7913d55c92b3d244bd2930844d38c7eefb8fb0665f4e52fe4bd7ea27c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.17.0/aarch64-linux-musl.tar.xz"
      sha256 "96f3834fc0df9058708b9c49dffd1ccc7e6d17fc9ce4f3fdae04a396e1a222fb"
    end
    on_intel do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.17.0/x86_64-linux-musl.tar.xz"
      sha256 "7f1ceb21773739facf7d2d9edef226bf30fd9d56aee28c15d874f4e473fc9bd6"
    end
  end

  def install
    bin.install "zdoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zdoc --version")
  end
end
