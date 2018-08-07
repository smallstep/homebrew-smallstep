class Step < Formula
  desc "Crypto and x509 Swiss-Army-Knife"
  homepage "https://github.com/smallstep/cli"
  url "https://github.com/smallstep/cli/archive/v0.0.1.tar.gz"
  sha256 "9299089abe4410a66add4fc34465660073c080aa0ff51db150e0601e7225fb88"

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
