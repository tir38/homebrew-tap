class Adbx < Formula
  desc "ADB extensions"
  homepage "https://github.com/tir38/ADBX"
  url "https://github.com/tir38/ADBX/archive/refs/tags/v1.0.tar.gz"
  sha256 "9b1b161a111b9bbbd5904f7aa20290f0b0107ebbfb320017328fefe44241c4f7"
  license ""

  depends_on "ruby"

  def install
    # Install the whole project into libexec so the script can reference other files
    libexec.install Dir["*"]


    # Ensure entrypoint is executable
    chmod "+x", libexec/"ax"

    # Expose the command on PATH.
    # This runs libexec/"ax" directly (shebang in ax should be `#!/usr/bin/env ruby`).
    bin.write_exec_script libexec/"ax"
  end

  test do
    system bin/"ax", "help"
  end
end
