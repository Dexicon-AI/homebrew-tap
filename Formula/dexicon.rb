# After releasing a new version, update the formula in homebrew-tap with:
# 1. New version number
# 2. New SHA256 checksums from the release checksums.txt
#
# Installation: brew install Dexicon-AI/tap/dexicon-cli

class Dexicon < Formula
  desc "CLI tool to discover, parse, and export AI coding assistant session logs"
  homepage "https://dexicon.ai"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64.tar.gz"
      sha256 "e40c3a710ec019b2d9ab73d49543eaf22a1f8bdc96a2aae725b841874a6a9be6"
    end
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64.tar.gz"
      sha256 "0583be3b3d72364f8be0bf90d5dea29fe29d64f94d9e91b054c96bd07d9e1892"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64.tar.gz"
      sha256 "980453d5bda0cd814200912064c3396513ee8ff01c63027322b068ed041afbb9"
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