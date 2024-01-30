require "language/node"

class Fdk < Formula
  desc "Freshworks Developer Kit"
  license "MIT"
  homepage "https://developer.freshworks.com/"
  sha256 "0b9cc7926a838c01ae91d520bbb0d451fcf7a22e49e4d743c64a7bc03ddf8f49"
  depends_on "node"


  option "with-version=", "Specify the version number to install"


  version  build.with?("--with-version=") || "latest"

  url "https://cdn.freshdev.io/fdk/#{version}.tgz"


  def install

    puts version
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "true"
  end
end
