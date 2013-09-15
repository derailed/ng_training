guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard :rspec, zeus: true, cli: "--color --format Fuubar --fail-fast --drb" do
  watch('spec/spec_helper.rb')                              { "spec" }
  watch('config/routes.rb')                                 { "spec/routing" }
  watch('app/controllers/application_controller.rb')        { "spec/controllers" }
  watch('app/assets/(.+)/(.+)(\.css|\.scss|\.js|\.coffee)') { "spec/features" } 
  watch('app/helpers/(.+)/(.+)_helper.rb')                  { |m| "spec/helpers/#{m[2]}_helper_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                                 { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})                { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                                 { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)/(.+)_controller\.rb$})                 { |m| ["spec/controllers/#{m[2]}_controller_spec.rb",
                                                                   "spec/features/#{m[2]}_spec.rb"] }
end