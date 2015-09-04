Rake::Task["test:run"].clear

namespace :test do

  Rails::TestTask.new(:_run) do |t|
    t.test_files = FileList["test/**/*_test.rb"].exclude(
      "test/integration/**/*_test.rb"
    )
  end

  Rails::TestTask.new(:fast) do |t|
    t.test_files = FileList["fast_test/**/*_test.rb"]
  end

  task :run => ["test:_run", "test:integration", "test:fast", "test:js"]

end
