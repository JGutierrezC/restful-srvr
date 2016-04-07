module RestfulSrvr::API::RSpec
  module Server
    class << self
      include RestfulSrvr::API::Mixin::Services

      def clear_cache
        cache_manager.clear
      end

      def instance
        RestfulSrvr::API::Application.instance
      end

      def running?
        RestfulSrvr::API::Application.running?
      end

      def start(options = {})
        options = options.reverse_merge(port: 26210, log_location: "/dev/null", endpoints: [])
        RestfulSrvr::API::Application.config.endpoints = options[:endpoints]
        unless running?
          RestfulSrvr::API::Application.run!(options)
          cache_builder.build
        end
      end

      def stop
        RestfulSrvr::API::Application.shutdown
      end
    end
  end
end
