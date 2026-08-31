class Gfix < Formula
  desc "Stacked-PR tools on plain git: absorb-driven fixups, folding, stack push"
  homepage "https://github.com/booka66/gfix"
  url "https://github.com/booka66/gfix/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d55d49c5c3b04e978838cf9aab88b9157568096c56679ad3cdd422ba1eafac01"
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
    system "git", "init", "-q"
    assert_equal "unknown", shell_output("#{bin}/gstack-info host").strip
  end
end
