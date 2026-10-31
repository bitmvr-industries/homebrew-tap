class Shtl < Formula
  desc "Go to directories by short route names"
  homepage "https://github.com/bitmvr-industries/shtl"
  url "https://github.com/bitmvr-industries/shtl/releases/download/v1.3.0/shtl"
  sha256 "6fc2c2b5e7f0a059e3361d0ae5b42ff3d80a29996d6ade48b1ab9a4336063966"
  license "MIT"

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
