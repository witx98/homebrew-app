class App < Formula
  desc "CLI tool for managing changelogs"
  homepage "https://github.com/witx98/app"
  version "1.1.11"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-linuxx64.zip"
    sha256 "5aee96148f6d069b7183ec06e267b47a66fc43eb10138c7aa240e7541e21d95c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinarm64.zip"
    sha256 "50b1e42a084db5d9ec21c4b8c304c6998a8e412b3ef92d1565648d2c05b865ad"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/witx98/app/releases/download/#{version}/app-darwinx64.zip"
    sha256 "8a71905c4e066260919cd40f30ac91848cd7082ab74860a912255ddbe1ef63fb"
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
    assert_match version.to_s, output
  end
end
