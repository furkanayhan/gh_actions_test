# frozen_string_literal: true

require "rspec/core/rake_task"
require "rubocop/rake_task"

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)

desc "Build the CLI (verify it loads and runs)"
task :build do
  ruby "-Ilib bin/greet --version"
end

task default: %i[rubocop spec build]
