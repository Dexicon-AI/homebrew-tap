# After releasing a new version, update the formula in homebrew-tap with:
# 1. New version number
# 2. New SHA256 checksums from the release checksums.txt
#
# Installation: brew install Dexicon-AI/tap/dexicon-cli

class Dexicon < Formula
  desc "CLI tool to discover, parse, and export AI coding assistant session logs"
  homepage "https://dexicon.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64.tar.gz"
      sha256 "5372f0d19e75eb0fa5a87d4dd25b9b9cd0b5da1ebca5b4b0f333243f4c521555"
    end
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64.tar.gz"
      sha256 "8a5982804611fa162c662f1634f1a940cb714511b5885077547bb25ca320e1cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64.tar.gz"
      sha256 "009e8c022a7704f507097d04dde726ba40a8a56913833f315a726cb2956d221f"
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