module Project
  class App < Sinatra::Base
    set :root, Project.root
    enable :sessions

    configure :development do
      register Sinatra::Reloader
    end

    helpers do
      def asset_path(source)
        "/assets/" + settings.sprockets.find_asset(source).digest_path
      end
    end

    get '/' do
      erb :index
    end
  end
end
