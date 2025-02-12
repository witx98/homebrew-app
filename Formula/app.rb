class App < Formula
  desc "A CLI tool for managing changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  version "1.1.5"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-linuxx64.zip"
    sha256 "cae19a6f91dc22ef2804a572b87526da337b4963cbfb48c9baf62c32129eab6c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "2965e181571d3878ae5ec5e0dd634879686f02230d80f0e3238cc5bab54cbf70"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinx64.zip"
    sha256 "c09924a1fde01a4572dc66850b4ca1d13b85250d891372052d026357144bec83"
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
end
