# After releasing a new version, update the formula in homebrew-tap with:
# 1. New version number
# 2. New SHA256 checksums from the release checksums.txt
#
# Installation: brew install Dexicon-AI/tap/dexicon-cli

class Dexicon < Formula
  desc "CLI tool to discover, parse, and export AI coding assistant session logs"
  homepage "https://dexicon.ai"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64.tar.gz"
      sha256 "42ac73597c093bda5fe20e59053cc8ea20bf6b9a1b6abbcfdec4b2fddea61406"
    end
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64.tar.gz"
      sha256 "4297d60636b7ec7e8ebfb5be37205bc9f1c825d3f2ea0d46f2e36a5b26d303a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64.tar.gz"
      sha256 "c868c7ed857427ea84be07e88f23e8407947c19a6e4192ccdb76d2e6220ecc08"
    end
  end

  def install
    # Homebrew strips the top-level directory from tarballs, so files are
    # extracted directly. Install everything to libexec and symlink the binary.
    # This keeps the .so/.dylib files together with the binary (required for it to work)

    libexec.install Dir["*"]
    bin.install_symlink libexec/"dexicon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dexicon --version")
  end
end