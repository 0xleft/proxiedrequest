# frozen_string_literal: true

require "bundler/gem_tasks"
require "standard/rake"

task default: :standard

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
    test.ruby_opts << '-r./test/simplecov_start.rb' if RUBY_VERSION >= '1.9'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
end

task :default => :test