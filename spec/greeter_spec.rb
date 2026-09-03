# frozen_string_literal: true

require "greeter"

RSpec.describe Greeter do
  describe ".greet" do
    it "greets the given name" do
      expect(described_class.greet("Ruby")).to eq("Hello, Ruby!")
    end

    it "defaults to World when name is nil" do
      expect(described_class.greet(nil)).to eq("Hello, World!")
    end

    it "defaults to World when name is blank" do
      expect(described_class.greet("   ")).to eq("Hello, World!")
    end

    it "strips surrounding whitespace" do
      expect(described_class.greet("  Ruby  ")).to eq("Hello, Ruby!")
    end

    it "shouts when shout is true" do
      expect(described_class.greet("Ruby", shout: true)).to eq("HELLO, RUBY!")
    end
  end
end
