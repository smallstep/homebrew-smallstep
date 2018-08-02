class Step < Formula
  desc "Crypto and x509 Swiss-Army-Knife"
  homepage "https://github.com/smallstep/cli"
  url "https://s3-us-west-1.amazonaws.com/smallstep-downloads/cli-0.0.1-rc.3.tar.gz"
  sha256 "016772a194579ca982efa0d4682597e3b85d953cd4179b5d9782cab30d113c46"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/smallstep/cli").install buildpath.children
    ENV.prepend_create_path "PATH", buildpath/"bin"
    cd  "src/github.com/smallstep/cli" do
      system "make", "build"
      bin.install "bin/step" => "step"
    end
  end

  test do
    system "#{bin}/step", "crypto", "keypair", "foo.pub", "foo.priv", "--no-password", "--insecure"
  end
end
