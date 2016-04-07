require 'restful-srvr/api/version'
require 'celluloid'
require 'hashie'
require 'ridley'
require 'json'

module RestfulSrvr
  module API
    USER_AGENT = "RestfulSrvr API v#{RestfulSrvr::API::VERSION}".freeze

    require_relative 'api/errors'
    require_relative 'api/logging'
    require_relative 'api/generic_server'

    require_relative 'api/application'
    require_relative 'api/config'
    require_relative 'api/endpoint'
    require_relative 'api/rack_app'
    # require_relative 'api/remote_cookbook'
    require_relative 'api/srv_ctl'
  end
end

Celluloid.logger.level = Logger::ERROR
