class Kkfetch < Formula
  desc "Fast, lightweight Linux, macOS, and Windows system information fetch tool written in Rust"
  homepage "https://github.com/kk376/kkfetch"
  license "MIT"
  version "0.18.1"

  on_macos do
    url "https://github.com/kk376/kkfetch/archive/refs/tags/v0.18.1.tar.gz"
    sha256 "928ad20878fd9bc038473aa578cadc78a888b168ea4f4a1bbb4c6a0dae657aff"
    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
      man1.install "man/kkfetch.1" if File.exist?("man/kkfetch.1")
      bash_completion.install "completions/kkfetch.bash" => "kkfetch" if File.exist?("completions/kkfetch.bash")
      zsh_completion.install "completions/_kkfetch" => "_kkfetch" if File.exist?("completions/_kkfetch")
      fish_completion.install "completions/kkfetch.fish" if File.exist?("completions/kkfetch.fish")
    end
  end

  on_linux do
    url "https://github.com/kk376/kkfetch/releases/download/v0.18.1/kkfetch-0.18.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "feeaf9ee3ab68acc38e112d6a50cbf906b3a39e94ae234ff749f7e81d77a8d4d"

    def install
      bin.install "kkfetch"
      man1.install "man/kkfetch.1" if File.exist?("man/kkfetch.1")
      bash_completion.install "completions/kkfetch.bash" => "kkfetch" if File.exist?("completions/kkfetch.bash")
      zsh_completion.install "completions/_kkfetch" => "_kkfetch" if File.exist?("completions/_kkfetch")
      fish_completion.install "completions/kkfetch.fish" if File.exist?("completions/kkfetch.fish")
    end
  end

  test do
    assert_match "kkfetch 0.18.1", shell_output("#{bin}/kkfetch --version")
  end
end
