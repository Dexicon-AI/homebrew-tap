# After releasing a new version, update the formula in homebrew-tap with:
# 1. New version number
# 2. New SHA256 checksums from the release checksums.txt
#
# Installation: brew install Dexicon-AI/tap/dexicon-cli

class Dexicon < Formula
  desc "CLI tool to discover, parse, and export AI coding assistant session logs"
  homepage "https://dexicon.ai"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64.tar.gz"
      sha256 "0ed12c397586b6f947012d7a039c138ca4c182304dfe2eb9bb078358afb36858"
    end
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64.tar.gz"
      sha256 "dae66b597125c3842f34100435b809c2efbf904ad6c38d78b8ba010fcac4585e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64.tar.gz"
      sha256 "4ec35ce6baaeb91b5c2155c2f15c20f4a043433e7968248704b702dd85d85b68"
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