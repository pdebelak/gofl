namespace :test do
  desc "Run jasmine specs in console"
  task :js => :environment do
    sh "phantomjs js_spec/spec_runner.js js_spec/SpecRunner.html"
  end

  desc "Open jasmine specs in browser"
  task :browser_js => :environment do
    sh "open js_spec/SpecRunner.html"
  end
end
