# After releasing a new version, update the formula in homebrew-tap with:
# 1. New version number
# 2. New SHA256 checksums from the release checksums.txt
#
# Installation: brew install Dexicon-AI/tap/dexicon-cli

class Dexicon < Formula
  desc "CLI tool to discover, parse, and export AI coding assistant session logs"
  homepage "https://dexicon.dev"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64.tar.gz"
      sha256 "8b9886272081f6e284f50a6725403e9810cc966efb6b9f42529243f38a133eda"
    end
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64.tar.gz"
      sha256 "591fffc7d5737dbc751b167ea0166a57f295880ce0281b210ced4e1407c0ec89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64.tar.gz"
      sha256 "ed8a215cef84a987e7dc5c41ee42ad77b5660e987122dd56e8dd77ace70f40cc"
    end
  end

  def install
    # The tarball extracts to a dexicon-cli/ directory containing:
    # - dexicon (the main binary)
    # - *.so files (shared libraries needed by the binary)
    # - certifi/cacert.pem (SSL certificates)
    #
    # We install everything to libexec and symlink the binary to bin
    # This keeps the .so files together with the binary (required for it to work)

    libexec.install Dir["dexicon-cli/*"]
    bin.install_symlink libexec/"dexicon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dexicon --version")
  end
end