class App < Formula
  desc "A CLI tool for managing changelogs"
  homepage "https://github.com/witx98/homebrew-test-logchange"
  version "1.1.7"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-linuxx64.zip"
    sha256 "a5696522adbfb25adc3d9c15c5ae6564c2aac7252af9a90fe19111f9ded457fa"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "970c841000681666c7835e351dcc59558dcb79c36bc27e5d4fc27066b28bad6b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/homebrew-test-logchange/releases/download/#{version}/app-darwinx64.zip"
    sha256 "ab9c3d777524b4bb7a08e093e629e73d0fe286e40e23785453f6e5cd61ef743d"
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
