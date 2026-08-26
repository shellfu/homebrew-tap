# Homebrew formula for sinter. Lives in the shellfu/homebrew-tap repo as
# Formula/sinter.rb; this copy is the source of truth. Placeholder sha256s
# are rewritten by update-formula.sh for a given release version.
class Sinter < Formula
  desc "Code graph for agents: typed nodes/edges with evidence-based resolution"
  homepage "https://github.com/shellfu/sinter"
  version "0.53.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-apple-darwin.tar.gz"
      sha256 "a60db39d962a65f6912897f82694a7636d40f496e0dd54d970b5fa9bcac1922b"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-apple-darwin.tar.gz"
      sha256 "64585ad9c46d378ed5daa7e4465c0b6acb535a25b774944fd27544666130a55f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5a94fffcafe3b12032aa7c3f8579f77a64b54ea34ea1a13970a68d29f467e748"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c50b25764fe39a6403ff20704ac0def7df42612439d0ade13c4f1b5b766389e8"
    end
  end

  def install
    bin.install "sinter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sinter --version")
  end
end
