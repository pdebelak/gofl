Rake::Task["test:run"].clear

namespace :test do

  Rails::TestTask.new(:_run) do |t|
    t.pattern = "test/**/*_test.rb"
  end

  Rails::TestTask.new(:fast) do |t|
    t.pattern = "fast_test/**/*_test.rb"
  end

  desc "Run all ruby tests"
  task :ruby => ["test:_run", "test:fast"]

  desc "Run all ruby and js tests"
  task :run => ["test:_run", "test:fast", "test:js"]

end
