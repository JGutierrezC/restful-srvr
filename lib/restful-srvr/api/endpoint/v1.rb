module RestfulSrvr::API
  module Endpoint
    class V1 < Endpoint::Base
      # helpers RestfulSrvr::API::Mixin::Services
      version 'v1', using: :header, vendor: 'RestfulSrvr'
      default_format :json

      rescue_from Grape::Exceptions::Validation do |e|
        body = JSON.generate({status: e.status, message: e.message, param: e.param})
        rack_response(body, e.status, "Content-type" => "application/json")
      end

      desc "list all known cookbooks"
      get 'universe' do
        #if cache_manager.warmed?
        #  cache_manager.cache
        #else
          header "Retry-After", 600
          status 503
        #end
      end

      desc "health check"
      get 'status' do
        {
          status: 'ok',
          version: RestfulSrvr::API::VERSION,
          #cache_status: cache_manager.warmed? ? 'ok' : 'warming',
          uptime: Time.now.utc - Application.start_time,
        }
      end

      desc "Something some thing"
      get 'hello_world' do
        {
          status: 'ok',
          message: "Hello World. Sincerely, #{params['name'] || 'nobody'}"
        }
      end
    end
  end
end
