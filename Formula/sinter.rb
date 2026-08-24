# Homebrew formula for sinter. Lives in the shellfu/homebrew-tap repo as
# Formula/sinter.rb; this copy is the source of truth. Placeholder sha256s
# are rewritten by update-formula.sh for a given release version.
class Sinter < Formula
  desc "Code graph for agents: typed nodes/edges with evidence-based resolution"
  homepage "https://github.com/shellfu/sinter"
  version "0.52.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-apple-darwin.tar.gz"
      sha256 "05c98e85372c6a09d0d1923dd38aaa071fc4d196186cb48f5c8675479fce9457"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-apple-darwin.tar.gz"
      sha256 "836bee5b4705da3a7ae1f7c860a926ff984dc8c825d246699f95b49e7dd98869"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1f3a562e40a9652c9b977cccf9f1920d7745b72474c1d1711590e1f6658708ed"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5801b434d5393f2b0c065479b93e43e51953d62958d94a9d1b91b53f31328276"
    end
  end

  def install
    bin.install "sinter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sinter --version")
  end
end
