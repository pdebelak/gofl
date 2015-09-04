namespace :test do
  desc "open jasmine specs in browser"
  task :js => :environment do
    sh "phantomjs js_spec/spec_runner.js js_spec/SpecRunner.html"
  end

  task :browser_js => :environment do
    sh "open js_spec/SpecRunner.html"
  end
end
