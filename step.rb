class Step < Formula
  desc ""
  homepage ""
  url "https://s3-us-west-1.amazonaws.com/smallstep-downloads/cli-0.0.1-rc.3.tar.gz"
  sha256 "7aaca3b1b72a02c6668847ad142cfb9d7255ac7c06de0b242b5e2249b8b17db0"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    system "sh gobuild.sh"
    system "make", "build" # if this fails, try separate make/make install steps
  end

  test do
    system "step", "crypto", "keypair", "foo.pub", "foo.priv"
  end
end
