set :database_file, 'config/database.yml'
set :environment, :development

def development?
  settings.environment == :development
end
