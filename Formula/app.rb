class App < Formula
  desc "A CLI tool for managing changelogs"
  homepage "https://github.com/witx98/app"
  version "1.1.8"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-linuxx64.zip"
    sha256 "2266f050fae74f742d5796fd1836875d133342ed6cfc301cdc50bdc9c8eb977a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "96081c96968f5f08610af7ecd065a9bb048a50f6c8d4b09af3ee0afa68804a3c"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinx64.zip"
    sha256 "73084b29438c3af55e5a0b93eb32a431e0328768b062fb55867d123449ceb7be"
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
    output = shell_output("#{bin}/app --version")
    assert_match version, output
  end
end
