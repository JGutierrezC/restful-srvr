require 'buff/config/json'
require 'digest/sha1'

module RestfulSrvr::API
  class Config < Buff::Config::JSON
    class << self
      # @return [String]
      def default_path
        home_path = ENV['RestfulSrvr_API_PATH'] || "#{ENV['HOME']}/.restful-srvr/api-server"
        File.expand_path(File.join(home_path, "config.json"))
      end
    end

    attribute 'home_path',
      type: String,
      default: File.expand_path("#{ENV['HOME']}/.restful-srvr/api-server")

    attribute 'endpoints',
      type: Array,
      default: [
        {
          type: "supermarket"
        }
      ]

    attribute 'build_interval',
      type: Float,
      default: 5.0

    def endpoints_checksum
      Digest::SHA1.hexdigest(endpoints.collect {|x| x.to_hash }.to_s)
    end
  end
end
