module RestfulSrvr::API
  class RackApp < Endpoint::Base
    mount RestfulSrvr::API::Endpoint::V1
  end
end
