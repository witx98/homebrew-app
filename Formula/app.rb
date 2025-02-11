class App < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  license "Apache-2.0"
  version "1.1.3"

  on_linux do
    on_intel do
      url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.3/app-1.1.3-linuxx64.zip"
      sha256 "368f35c445eb779818393a6c44aa9669d9ec7c6d2b6e25092bbbd809da5a9ded"
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