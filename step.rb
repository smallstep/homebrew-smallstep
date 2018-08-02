class Step < Formula
  desc ""
  homepage ""
  url "https://s3-us-west-1.amazonaws.com/smallstep-downloads/cli-0.0.1-rc.3.tar.gz"
  sha256 "016772a194579ca982efa0d4682597e3b85d953cd4179b5d9782cab30d113c46"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    system "./.brew/build"
    bin.install "../.gobuild/src/github.com/smallstep/cli/bin/step" => "step"
  end

  test do
    system "step", "crypto", "keypair", "foo.pub", "foo.priv"
  end
end
