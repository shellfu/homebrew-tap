# Homebrew formula for sinter. Lives in the shellfu/homebrew-tap repo as
# Formula/sinter.rb; this copy is the source of truth. Placeholder sha256s
# are rewritten by update-formula.sh for a given release version.
class Sinter < Formula
  desc "Code graph for agents: typed nodes/edges with evidence-based resolution"
  homepage "https://github.com/shellfu/sinter"
  version "0.57.5"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-apple-darwin.tar.gz"
      sha256 "b5e3ab3cc2330e179105aa528927507ff1967425ef9a9f26c15c363c201f5f0c"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-apple-darwin.tar.gz"
      sha256 "8a2b9df9b24840893c1406d2781b28c8273af2719cdca04750d585ba159e41ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5432780b0f7091e87a538959c2b61ba6ef814e7b2f54d5f30f32ef7985f78f77"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-unknown-linux-musl.tar.gz"
      sha256 "06ee4dd9500c8a86b42ffcb06c71d978d032650d66248a52cbe9e71ea3940430"
    end
  end

  def install
    bin.install "sinter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sinter --version")
  end
end
