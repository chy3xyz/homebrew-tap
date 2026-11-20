class Zmodu < Formula
  desc "Compile-time modular application framework and runtime for Zig (CLI)"
  homepage "https://github.com/chy3xyz/zmodu"
  version "0.43.8"
  license "MIT"

  livecheck do
    url "https://github.com/chy3xyz/zmodu"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-macos.tar.gz"
      sha256 "e1828755f638f3cf2e7394e198e304bcd6453abfb6398b8973ade6381ecfb0d1"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-macos.tar.gz"
      sha256 "426d2efde63f4147e9114a8cbfb7eb5c09de041684948d8deceb94574ea3d7b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-aarch64-linux.tar.gz"
      sha256 "5973245eb7ee8bde681f55e4e952dc48a4ddc0f232800fdd8b704fe1a57dc1cd"
    end
    on_intel do
      url "https://github.com/chy3xyz/zmodu/releases/download/v#{version}/zmodu-#{version}-x86_64-linux.tar.gz"
      sha256 "1352f9a9e1b69d71a4e2f1caa39b2aff4d3db22278557b6b7e8f39cf562358cd"
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
