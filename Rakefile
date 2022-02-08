# frozen_string_literal: true

require "bundler"
require "rake/testtask"

Bundler::GemHelper.install_tasks name: "inspec-objects"

Rake::TestTask.new(:unit) do |t|
  t.libs << "test"
  t.test_files = Dir.glob([
                            "test/unit/**/*_test.rb",
                          ])
end

begin
  require "chefstyle"
  require "rubocop/rake_task"
  desc "Run Chefstyle tests"
  RuboCop::RakeTask.new(:style) do |task|
    task.options += ["--display-cop-names", "--no-color"]
  end
rescue LoadError
  puts "chefstyle gem is not installed. bundle install first to make sure all dependencies are installed."
end

task :console do
  require "irb"
  require "irb/completion"
  require "inspec/objects"
  ARGV.clear
  IRB.start
end

task default: %i{unit style}
