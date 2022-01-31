require_relative "../../lib/gsnippet/configuration"

RSpec.describe Gsnippet::Configuration do
  describe "#disabled?" do
    context "when all values are not set" do
      config = Gsnippet::Configuration.new(
        container_id: nil,
        env_auth: nil,
        env_key: nil
      )
      it_is_asserted_by { config.disabled? }
    end

    context "when all values are set" do
      config = Gsnippet::Configuration.new(
        container_id: "GTM-1234567",
        env_auth: "xxx",
        env_key: "env-1"
      )
      it_is_asserted_by { config.disabled? == false }
    end

    context "when container_id is not set" do
      config = Gsnippet::Configuration.new(
        container_id: nil,
        env_auth: "xxx",
        env_key: "env-1"
      )
      it_is_asserted_by { config.disabled? }
    end
  end
end
