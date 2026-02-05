class Adbx < Formula
  desc "ADB extensions"
  homepage "https://github.com/tir38/ADBX"
  url "https://github.com/tir38/ADBX/archive/refs/tags/v1.0.tar.gz"
  sha256 "9b1b161a111b9bbbd5904f7aa20290f0b0107ebbfb320017328fefe44241c4f7"
  license ""

  depends_on "ruby"
  depends_on "bash-completion@2"  

  def install
	 # Install all project files into libexec to keep runtime dependencies self-contained
	libexec.install Dir["*"]

	# Mark the main entrypoint as executable
	chmod "+x", libexec/"ax"

	# Create a wrapper in bin so `ax` is available on PATH
	bin.write_exec_script libexec/"ax"

	# Install bash completion for ax
	bash_completion.install libexec/"ax_completion.bash" => "ax"
  end

  test do
    system bin/"ax", "help"
  end
end
