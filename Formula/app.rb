class App < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  license "Apache-2.0"
  version "1.0.14"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-linuxx64.zip"
    sha256 "861cfe4c979841a1df01a709ed25c4281a1d3be2664e21e072cecee9daa53e5b"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-linuxx64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-linuxx64/app-#{version}-runner"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "c3b2d749f808fda00037560003ab5e09ea2993e09129b7210b9e38009cff935a"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-darwinarm64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-darwinarm64/app-#{version}-runner"
    end
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinx64.zip"
    sha256 "8e0550762a1d300eaf01e8c9285d9141434dd411878836ad5b4358c2910ceed7"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-darwinx64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-darwinx64/app-#{version}-runner"
    end
  end
end
