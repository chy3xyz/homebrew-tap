class Zmodu < Formula
  desc "Compile-time modular application framework and runtime for Zig"
  homepage "https://github.com/chy3xyz/zmodu"
  url "https://github.com/chy3xyz/zmodu/archive/refs/tags/v0.41.0.tar.gz"
  sha256 "a0244e6bf5c40930120ac1658901a9a0ef6a58564f3ea96b1177ad27ca464621"
  license "MIT"
  head "https://github.com/chy3xyz/zmodu.git", branch: "master"

  livecheck do
    url "https://github.com/chy3xyz/zmodu"
    strategy :github_latest
  end

  depends_on "zig" => :build

  def install
    # Only the CLI is built: the framework is a library consumers fetch with
    # `zig fetch`/`build.zig.zon`, and `tools/zmodu` is a standalone build
    # entry (it pulls the two shared modules by relative path).
    cd "tools/zmodu" do
      system "zig", "build", "-Doptimize=ReleaseSafe"
      bin.install "zig-out/bin/zmodu"
    end
  end

  test do
    # `zmodu --version` logs to stderr; capture both streams.
    assert_match "0.41.0", shell_output("#{bin}/zmodu --version 2>&1")
    assert_match "Usage", shell_output("#{bin}/zmodu 2>&1")
  end
end
