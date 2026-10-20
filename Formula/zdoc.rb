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
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.16.2/aarch64-macos.zip"
      sha256 "7169715a3ac61b98d81e218462568cab287448abd46a1b7b04dd046fc0ce274c"
    end
    on_intel do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.16.2/x86_64-macos.zip"
      sha256 "dd06e49148c6d4487757b434fae17335018b7e9bf498fa9906f2c7a065219e85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.16.2/aarch64-linux-musl.tar.xz"
      sha256 "314706d2c5bdcfdc14fd8b4517382955d17dc41cd26bc9a2de7d9564239f2b4c"
    end
    on_intel do
      url "https://github.com/chy3xyz/zdoc/releases/download/v0.16.2/x86_64-linux-musl.tar.xz"
      sha256 "6f0fd393be6d85ce45c47c39a9451ac689bc604f7751e743dd2ae821b0daf819"
    end
  end

  def install
    bin.install "zdoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zdoc --version")
  end
end
