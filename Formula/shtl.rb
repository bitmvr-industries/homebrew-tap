class Shtl < Formula
  desc "Go to directories by short route names"
  homepage "https://github.com/bitmvr-industries/shtl"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.0.0/shtl-darwin-arm64.tar.gz"
      sha256 "2f4e8a46fa14be61d9c5b23d4492cc408782c1630b4447d082778481548f0978"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.0.0/shtl-linux-amd64.tar.gz"
      sha256 "91993a1cef96a9fceda4c2dbd6caad9b4ad4b43c6ceb90c84ff4478e10951a3d"
    end
    on_arm do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.0.0/shtl-linux-arm64.tar.gz"
      sha256 "2c2d38d320e05667c3e64d7820b40dcd35432b9c3464a77dc7e8980f29c00cbf"
    end
  end

  def install
    bin.install "shtl"
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
    system bin/"shtl", "add", "home", testpath
    assert_equal testpath.to_s, shell_output("#{bin}/shtl path home").strip
  end
end
