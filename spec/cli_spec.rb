# frozen_string_literal: true

require "greeter"

RSpec.describe "greet CLI" do # rubocop:disable RSpec/DescribeClass
  def run_cli(*args)
    Open3.capture2e(RbConfig.ruby, File.join(PROJECT_ROOT, "bin", "greet"), *args)
  end

  it "greets a provided name" do
    output, status = run_cli("Ruby")
    expect(status).to be_success
    expect(output.chomp).to eq("Hello, Ruby!")
  end

  it "defaults to World with no arguments" do
    output, status = run_cli
    expect(status).to be_success
    expect(output.chomp).to eq("Hello, World!")
  end

  it "shouts with --shout" do
    output, status = run_cli("Ruby", "--shout")
    expect(status).to be_success
    expect(output.chomp).to eq("HELLO, RUBY!")
  end

  it "prints the version with --version" do
    output, status = run_cli("--version")
    expect(status).to be_success
    expect(output.chomp).to eq(Greeter::VERSION)
  end

  it "prints usage with --help" do
    output, status = run_cli("--help")
    expect(status).to be_success
    expect(output).to include("Usage: greet")
  end
end
