class App < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  license "Apache-2.0"
  version "1.1.2"

  on_linux do
    on_intel do
      url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.2/app-1.1.2-linuxx64.zip"
      sha256 "50810c5f6f5674b39241d58ee0000945cea3f45c4444a0c6e4b837020bb5da31"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.2/app-1.1.2-darwinarm64.zip"
      sha256 "37bab0d73dbcdda396963f9e7587f7d6843d70d6d595e7de565efb66d909d192"
    end
    on_intel do
      url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.2/app-1.1.2-darwinx64.zip"
      sha256 "7e1cd3f2b433dd2159e7cba5fe811eedf61b8cf34f19c86e73e2a1fa0321b1e5"
    end
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