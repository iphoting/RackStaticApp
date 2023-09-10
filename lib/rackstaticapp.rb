require 'rackstaticapp/version'
require 'rack'
require 'vienna'

##
# Zero-configuration convenience wrapper around `RackStaticApp::Application`, which inherits from `Vienna::Application`.
# Add this to your `config.ru`:
#
#     require 'rackstaticapp'
#     run RackStaticApp
#
# Your static site in `public` will be served.
#

module RackStaticApp

  class << self
    def call(env)
      Application.new.call(env)
    end
  end

  ##
  # `RackStaticApp::Static` is just a wrapper for `Rack::Static` with
  # sane and opinionated options.
  #
  # It serves all files under the given `root` and doesn't passes on requests
  # for files that don't exist.
  #
  # Examples
  #
  #     use RackStaticApp::Static, 'public'
  #

  class Static < Vienna::Static
    def initialize(app, root)
      super
    end

    def urls
      [""]
    end

    def root
      super
    end

    def index
      super
    end

    def header_rules
      super
    end

    def options
      {urls: urls, root: root, index: index, header_rules: header_rules, cascade: true}
    end
  end

  ##
  # `RackStaticApp::NotFound` is a default endpoint not unlike `Rack::NotFound`.
  # Initialize it with the path to a 404 page and its contents will be served.
  # The difference is that if a 404 page doesn't exist, a default response,
  # 'Not Found' will be served.
  #
  # Examples
  #
  #     run RackStaticApp::NotFound.new('public/404.html')
  #
  #     run RackStaticApp::NotFound.new # Always return 'Not Found'
  #

  class NotFound < Vienna::NotFound
  end

  ##
  # `RackStaticApp::Application` serves all files under the given root directory
  # using `RackStaticApp::Static`. If a file/path doen't exist, `RackStaticApp::NotFound`
  # is run, which always returns a status of `404` and the contents of
  # `404.html` or `'Not Found'` if one does not exist.
  #
  # Examples
  #
  #     run RackStaticApp::Application.new('_site')
  #
  #     run RackStaticApp::Application.new # The root defaults to 'public'
  #

  class Application < Vienna::Application
    def initialize(root = 'public')
      @app = Rack::Builder.new do
        use Static, root
        run NotFound.new("#{root}/404.html")
      end
    end
  end
end
