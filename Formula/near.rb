class Near < Formula
  desc "Human-friendly console utility for interacting with NEAR Protocol"
  homepage "https://near.cli.rs"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/near/near-cli-rs/releases/download/v0.29.0/near-cli-rs-aarch64-apple-darwin.tar.gz"
      sha256 "77e57d1f4928e7694275e37363507c10527f317de3acea9eeab933dff35372bf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/near/near-cli-rs/releases/download/v0.29.0/near-cli-rs-x86_64-apple-darwin.tar.gz"
      sha256 "1730daea215ec625de4e64399eda8cf019f0b13da53318e0b64a9e0b570802cd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/near/near-cli-rs/releases/download/v0.29.0/near-cli-rs-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6107d3e5779f9a903e8147aee16b734834c1caf58e4e67c4cdb284bac1b95b0b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/near/near-cli-rs/releases/download/v0.29.0/near-cli-rs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e63eb0610972c5e2f9fc451056fa0187201c19b8aa49e72143de70c57d043d09"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  def install
    bin.install "near"

    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/near --version")
  end
end
