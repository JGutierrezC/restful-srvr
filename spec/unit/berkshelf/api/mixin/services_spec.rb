require 'spec_helper'
require 'restful-srvr/api/rest_gateway'

describe RestfulSrvr::API::Mixin::Services do
  let(:includer) do
    Class.new { include RestfulSrvr::API::Mixin::Services }.new
  end

  describe "#cache_builder" do
    subject { includer.cache_builder }

    context "when the CacheBuilder is running" do
      before { RestfulSrvr::API::CacheBuilder.start }

      it "returns the running instance of CacheBuilder" do
        expect(subject).to be_a(RestfulSrvr::API::CacheBuilder)
      end
    end

    context "when the CacheBuilder is not running" do
      before { RestfulSrvr::API::CacheBuilder.stop }

      it "raises a NotStartedError" do
        expect { subject }.to raise_error(RestfulSrvr::API::NotStartedError)
      end
    end
  end

  describe "#cache_manager" do
    subject { includer.cache_manager }

    context "when the CacheManager is running" do
      before { RestfulSrvr::API::CacheManager.start }

      it "returns the running instance of CacheManager" do
        expect(subject).to be_a(RestfulSrvr::API::CacheManager)
      end
    end

    context "when the CacheManager is not running" do
      before { RestfulSrvr::API::CacheManager.stop }

      it "raises a NotStartedError" do
        expect { subject }.to raise_error(RestfulSrvr::API::NotStartedError)
      end
    end
  end

  describe "#rest_gateway" do
    subject { includer.rest_gateway }

    context "when the RESTGateway is running" do
      before { RestfulSrvr::API::RESTGateway.start }

      it "returns the running instance of RESTGateway" do
        expect(subject).to be_a(RestfulSrvr::API::RESTGateway)
      end
    end

    context "when the RESTGateway is not running" do
      before { RestfulSrvr::API::RESTGateway.stop }

      it "raises a NotStartedError" do
        expect { subject }.to raise_error(RestfulSrvr::API::NotStartedError)
      end
    end
  end
end
