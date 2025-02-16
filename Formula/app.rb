class App < Formula
  desc "CLI tool for managing changelogs"
  homepage "https://github.com/witx98/app"
  version "1.1.10"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-linuxx64.zip"
    sha256 "cf5b2e21bbb5fe846110aeb607a66d70242b3a1673d2bc7e0581ca8fa14b3bd4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "4b9f682ff0fd0253af226e805d8ec502eb1200efafa04cf81b51c20c8b04b008"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinx64.zip"
    sha256 "a699771c64e5a1e739349b3c0ec79f9240ca9d3447bd77e84976a4d5430c2d59"
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
    assert_match version, output
  end
end
