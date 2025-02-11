class App < Formula
  desc "CLI tool for managing markdown changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  license "Apache-2.0"
  version "1.1.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-#{version}-linuxx64.zip"
    sha256 "6bec4e414628475567563e7166e30379fbc75ebb4b36090abd584ac9de910eb8"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-#{version}-linuxx64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-#{version}-linuxx64/app-#{version}-runner"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-#{version}-darwinarm64.zip"
    sha256 "dffe0097e40cb993b7203aedac6bb8070495d3068adf0f5ae94a256171e0a9e4"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-#{version}-darwinarm64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-#{version}-darwinarm64/app-#{version}-runner"
    end
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-#{version}-darwinx64.zip"
    sha256 "feb0c7542e4aeb56eab44bb651affb3cfc7c3d26811865add4140116a573d29b"
    def install
      libexec.install Dir["*"]
      chmod 0755, "#{libexec}/app-#{version}-darwinx64/app-#{version}-runner"
      bin.write_exec_script "#{libexec}/app-#{version}-darwinx64/app-#{version}-runner"
    end
  end
end
