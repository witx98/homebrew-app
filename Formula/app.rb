class App < Formula
  desc "CLI tool for managing changelogs"
  homepage "https://github.com/witx98/app"
  version "1.2.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-linuxx64.zip"
    sha256 "a70e5cb004ce60eb52b4c635fa1aeadaa01b6a0a1905df189609a2877c5babb5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "6ccdd42bd80efb828790fcc7caec7742258444f921f8fa248324a4a6eb608a71"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinx64.zip"
    sha256 "3e5962d0272d2ecbb4314ff256794f22251a0e8bc61d5fa1490eb019794eca6c"
  end

  def install
    libexec.install Dir["*"]
    os_arch = ""
    if OS.linux? && Hardware::CPU.intel?
      os_arch = "linuxx64"
    elsif OS.mac? && Hardware::CPU.arm?
      os_arch = "darwinarm64"
    elsif OS.mac? && Hardware::CPU.intel?
      os_arch = "darwinx64"
    else
      puts "Unsupported system or architecture!"
    end
    chmod 0755, "#{libexec}/app-#{os_arch}/app-#{version}-runner"
    bin.write_exec_script "#{libexec}/app-#{os_arch}/app-#{version}-runner"
  end

  test do
    output = shell_output("#{bin}/app-#{version}-runner --version")
    assert_match version.to_s, output
  end
end
