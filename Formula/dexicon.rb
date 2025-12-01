# typed: false
# frozen_string_literal: true

# Homebrew formula for Dexicon CLI
#
# To update after a new release:
# 1. Download each binary from the release
# 2. Run: shasum -a 256 <binary-file>
# 3. Update the version and sha256 values below
#
class Dexicon < Formula
  desc "Index and search your AI coding assistant sessions"
  homepage "https://dexicon.ai"
  version "0.2.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-arm64"
      sha256 "REPLACE_WITH_SHA256_DARWIN_ARM64"
    end

    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64"
      sha256 "REPLACE_WITH_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64"
      sha256 "REPLACE_WITH_SHA256_LINUX_AMD64"
    end
  end

  def install
    binary_name = "dexicon-cli-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"}"
    bin.install binary_name => "dexicon"
  end

  test do
    assert_match "Dexicon", shell_output("#{bin}/dexicon --version")
  end
end
