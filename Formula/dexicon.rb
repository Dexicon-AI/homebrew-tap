# After releasing a new version, update the formula in homebrew-tap with:
# 1. New version number
# 2. New SHA256 checksums from the release checksums.txt
#
# Installation: brew install Dexicon-AI/tap/dexicon-cli

class Dexicon < Formula
  desc "CLI tool to discover, parse, and export AI coding assistant session logs"
  homepage "https://dexicon.ai"
  version "0.4.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64.tar.gz"
      sha256 "4cb47be6b6ad9dede47b81c391db51c532f1500ec26a6f1643f2fdcb39895c81"
    end
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64.tar.gz"
      sha256 "769a64adbfb0db61ab8633e39c5d8fedcd05eec841ebe86e487ad98aeed4a3b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64.tar.gz"
      sha256 "d5fed326c09a1bfcf2ceef5efd5be98c7f911ae0d004d5cb9d9f4230ae19bc30"
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