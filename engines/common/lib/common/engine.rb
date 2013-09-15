module Common
  class Engine < ::Rails::Engine
    isolate_namespace Common
    
    initializer :append_migrations do |app|
      next if app.root.to_s.match self.root.to_s
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
      end
    end
  end
end
