class Zoxy < Formula
  desc "Zero-allocation L4/L7 edge proxy in Zig"
  homepage "https://zoxy.io/"
  license "MIT"

  livecheck do
    url "https://github.com/zoxy-io/zoxy"
    strategy :github_latest
  end

  # Apple Silicon only. There is no Intel macOS bottle from
  # 0.2.0 on: building one needs an Intel macOS runner, and
  # GitHub's is retired. Homebrew on an Intel Mac will report
  # that no bottle is available rather than download one that
  # cannot run, which is the failure worth having.
  on_macos do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.0/zoxy-0.9.0-aarch64-macos.tar.gz"
      sha256 "483912733b2bd1ffccd43a1b4a857e17022c86822af51c1dc670a7d41ddf288c"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.0/zoxy-0.9.0-x86_64-macos.tar.gz"
      sha256 "bbbe9c6650aeea8d36aee0541b054c8949a4ad33d94d287216a8df79ee2aa01d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.0/zoxy-0.9.0-aarch64-linux.tar.gz"
      sha256 "476ebdb3c837e7d928a465a43dc3c94a6d1416c09ebc51908e6a4e7f8845ecff"
    end
    on_intel do
      url "https://github.com/zoxy-io/zoxy/releases/download/v0.9.0/zoxy-0.9.0-x86_64-linux.tar.gz"
      sha256 "0c24b7dea056113033e811d0f6c400f91dafde3b4c1388063177dacebbb81304"
    end
  end

  def install
    bin.install "zoxy"
  end

  test do
    output = shell_output("#{bin}/zoxy #{testpath}/missing.json 2>&1", 1)
    assert_match "cannot read config", output
  end
end
