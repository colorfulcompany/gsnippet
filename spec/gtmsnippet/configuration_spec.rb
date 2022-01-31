require_relative "../../lib/gtmsnippet/configuration"

RSpec.describe Gtmsnippet::Configuration do
  describe "#disabled?" do
    context "when all values are not set" do
      config = Gtmsnippet::Configuration.new(
        container: nil,
        auth: nil,
        preview: nil
      )
      it_is_asserted_by { config.disabled? }
    end

    context "when all values are set" do
      config = Gtmsnippet::Configuration.new(
        container: "GTM-1234567",
        auth: "xxx",
        preview: "env-1"
      )
      it_is_asserted_by { config.disabled? == false }
    end

    context "when container is not set" do
      config = Gtmsnippet::Configuration.new(
        container: nil,
        auth: "xxx",
        preview: "env-1"
      )
      it_is_asserted_by { config.disabled? }
    end
  end
end
