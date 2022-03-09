# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RspecJsonReportAnalyser < Formula
  desc ""
  homepage ""
  url "https://github.com/singhprd/rspec-json-report-analyser/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e3e010d9965a6b6cafaccef6ae1fea50b1fc3f9cf4094a2f65ac53abc438c9ee"
  license ""

  uses_from_macos "ruby"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test rspec-json-report-analyser`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
