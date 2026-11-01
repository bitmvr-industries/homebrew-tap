class Shtl < Formula
  desc "Go to directories by short route names"
  homepage "https://github.com/bitmvr-industries/shtl"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.1.0/shtl-darwin-arm64.tar.gz"
      sha256 "1d12032b93b5304bb8f4aae9ab1b42465e4731c216577c4dc16ba203c7b05f24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.1.0/shtl-linux-amd64.tar.gz"
      sha256 "083b38724b3646f3fa98cf178946423ea93bf6f502ae75c290bb6b9ecdd18835"
    end
    on_arm do
      url "https://github.com/bitmvr-industries/shtl/releases/download/v2.1.0/shtl-linux-arm64.tar.gz"
      sha256 "97c9539e6d795fed1894be05684eb017c55b8f844427c8cd0cd7a4add4c3695f"
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
