# Homebrew formula for sinter. Lives in the shellfu/homebrew-tap repo as
# Formula/sinter.rb; this copy is the source of truth. Placeholder sha256s
# are rewritten by update-formula.sh for a given release version.
class Sinter < Formula
  desc "Code graph for agents: typed nodes/edges with evidence-based resolution"
  homepage "https://github.com/shellfu/sinter"
  version "0.57.4"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-apple-darwin.tar.gz"
      sha256 "6016c321018a66a9b45c60e98fe694daf2db08f61df9ac53d5161324406d7347"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-apple-darwin.tar.gz"
      sha256 "f9bd584e82dc0f38723765313e9c98a8a9292781f621317bcf2b14f7563bcbf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3c051354f37ef6a59bc7acd4e8ab57184a0c0ac359b0318bd40dfb1a4611e80d"
    else
      url "https://github.com/shellfu/sinter/releases/download/v#{version}/sinter-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f644e7ae79fb9cc05586d98d9d36dfcea49d102f98d0c6a3866656798e6464e5"
    end
  end

  def install
    bin.install "sinter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sinter --version")
  end
end
