ENGINES = %w[social]

namespace :build do
  task :all do
    puts "-"*100
    puts "-- Main app specs..."
    out = %x[bundle exec rspec]
    puts out
    puts "-"*100    
    ENGINES.each do |engine|
      puts "="*100
      puts ">> Engine #{engine} specs"
      Dir.chdir( File.expand_path( "engines/#{engine}", Rails.root ) ) do
        out = %x[bundle exec rspec]
        puts out
      end
      puts "="*100      
    end
  end
end