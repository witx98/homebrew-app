class App < Formula
  desc "CLI tool for managing changelogs"
  homepage "https://github.com/witx98/app"
  version "1.1.9"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-linuxx64.zip"
    sha256 "fa72a8079e84c0fe791c07b510b0642203eebc38a115fa07cc6797a76c723ce8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "8bbf0214174f2c1659b445e40e2b936d661860252d8fc9490e5ca41ad78ae4cd"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinx64.zip"
    sha256 "c533baa29d8ed8765525412267e3b5d5071e659251f015fff111e92e14dfcb83"
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
