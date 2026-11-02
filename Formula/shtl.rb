class Shtl < Formula
  desc "Go to directories by short route names"
  homepage "https://github.com/bitmvr-industries/shtl"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.1.1/shtl-darwin-arm64.tar.gz"
      sha256 "5a8ec2fd12e7800ccfbb004b37baf259cf0d8c71d946546494180016b0872da6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.1.1/shtl-linux-amd64.tar.gz"
      sha256 "3c48391a0be2c7da451131304b167ba07430ba54c308524cea06fba17ca1a0ed"
    end
    on_arm do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.1.1/shtl-linux-arm64.tar.gz"
      sha256 "cbf4cf8e0a4cce21cfe8e14891dcdc5b491d582fe1e9e4562243b75df6c3bff0"
    end
  end

  def install
    bin.install "shtl"
    man1.install "shtl.1"
  end

  def caveats
    <<~EOS
      shtl needs a shell function in your rc file to change directories
      and tab-complete routes. To add it, run:
        shtl setup
    EOS
  end

  test do
    ENV["XDG_CONFIG_HOME"] = testpath/"config"
    assert_equal version.to_s, shell_output("#{bin}/shtl version").strip
    assert_path_exists man1/"shtl.1"
    system bin/"shtl", "add", "home", testpath
    assert_equal testpath.to_s, shell_output("#{bin}/shtl path home").strip
  end
end
