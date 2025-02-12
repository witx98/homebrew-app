# Generated with JReleaser 1.16.0 at 2025-02-12T20:31:47.529020104Z

class App < Formula
  desc "A CLI tool for managing changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  version "1.1.4"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-linuxx64.zip"
    sha256 "cd3dcdfef876647374af411357f8908c10cbc7016bc462d8152bb80cade8a6a8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "ca5d5d0817061145ad2a086ac2a834b282c9576ed6cf14f98e2c062e66bd5125"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinx64.zip"
    sha256 "8e30645b245f24d4adbef7a16daa83cddf2e383e8c43b89dd82afaa7671fb34e"
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
      puts "Invalid system or architecture"
    end
    chmod 0755, "#{libexec}/app-#{version}-#{os_arch}/app-#{version}-runner"
    bin.write_exec_script "#{libexec}/app-#{version}-#{os_arch}/app-#{version}-runner"
  end
end
