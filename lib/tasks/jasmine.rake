namespace :test do
  desc "open jasmine specs in browser"
  task :js => :environment do
    system "open js_spec/SpecRunner.html"
  end
end
