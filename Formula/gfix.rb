class Gfix < Formula
  desc "Stacked-PR tools on plain git: absorb-driven fixups, folding, stack push"
  homepage "https://github.com/booka66/gfix"
  url "https://github.com/booka66/gfix/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "37a97fbd54755e23f5ac1f335844bf6c27d440d2a6c8d174e2d10ff2c2b04466"
  license "MIT"

  depends_on "bash"
  depends_on "fzf"
  depends_on "git-absorb"

  def install
    libexec.install "gfix", "gfix-preview", "gfix-step", "gsp", "gstack-info", "gtuck"
    bin.install_symlink libexec/"gfix", libexec/"gtuck", libexec/"gsp", libexec/"gstack-info"
  end

  def caveats
    <<~EOS
      Optional: install gh (GitHub) or glab (GitLab) plus jq to get PR/MR
      annotations in gfix's picker and gsp's output.
    EOS
  end

  test do
    output = shell_output("#{bin}/gstack-info bogus 2>&1", 1)
    assert_match "usage: gstack-info", output
  end
end
