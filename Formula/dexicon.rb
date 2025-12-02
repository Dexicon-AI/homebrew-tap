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
      sha256 "77bd3aacc2b2e4346ee3b6674b0e6a4b55f2009f2ca98a93fcfff7dc12425639"
    end

    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-darwin-amd64"
      sha256 "8b4c01e0bae20f79baf71a33e92b9953b713a31730c772d1b3b46a75331786a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Dexicon-AI/get-dexicon-cli/releases/download/v#{version}/dexicon-cli-linux-amd64"
      sha256 "f833e994bd1c25b5e22b9e9d5a512d74ff38053d20935fad50c65c9c65e557c5"
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
