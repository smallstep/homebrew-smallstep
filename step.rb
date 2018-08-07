class Step < Formula
  desc "Crypto and x509 Swiss-Army-Knife"
  homepage "https://github.com/smallstep/cli"
  url "https://github.com/smallstep/cli/archive/v0.0.1.tar.gz"
  sha256 "64dff39016acc0ae61aefb8a25cec2b629ad86d1583a7a43ac69c96f4426cbb9"

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
