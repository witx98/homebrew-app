class App < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  license "Apache-2.0"
  version "1.1.2"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.2/app-1.1.2-linuxx64.zip"
    sha256 "50810c5f6f5674b39241d58ee0000945cea3f45c4444a0c6e4b837020bb5da31"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-1.1.0-linuxx64/app-1.1.0-runner"
      bin.write_exec_script "#{libexec}/app-1.1.0-linuxx64/app-1.1.0-runner"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.0/app-1.1.0-darwinarm64.zip"
    sha256 "dffe0097e40cb993b7203aedac6bb8070495d3068adf0f5ae94a256171e0a9e4"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-1.1.0-darwinarm64/app-1.1.0-runner"
      bin.write_exec_script "#{libexec}/app-1.1.0-darwinarm64/app-1.1.0-runner"
    end
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/1.1.0/app-1.1.0-darwinx64.zip"
    sha256 "feb0c7542e4aeb56eab44bb651affb3cfc7c3d26811865add4140116a573d29b"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-1.1.0-darwinx64/app-1.1.0-runner"
      bin.write_exec_script "#{libexec}/app-1.1.0-darwinx64/app-1.1.0-runner"
    end
  end
end
