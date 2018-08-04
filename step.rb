class Step < Formula
  desc "Crypto and x509 Swiss-Army-Knife"
  homepage "https://github.com/smallstep/cli"
  url "https://s3-us-west-1.amazonaws.com/smallstep-downloads/cli-0.0.1-rc.4.tar.gz"
  sha256 "17bbc2ba6748ff84e0f71dc1adf17a56dc7cd5e7d1a758e1e9bdaca48815b02a"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/smallstep/cli").install buildpath.children
    cd  "src/github.com/smallstep/cli" do
      system "make", "build"
      bin.install "bin/step" => "step"
      bash_completion.install "autocomplete/bash_autocomplete" => "step"
    end
  end

  test do
    system "#{bin}/step", "crypto", "keypair", "foo.pub", "foo.priv", "--no-password", "--insecure"
  end
end
