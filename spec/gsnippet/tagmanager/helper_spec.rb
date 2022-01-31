RSpec.describe Gsnippet::Helper do
  include Gsnippet::Helper

  describe "#gtm_head_snippet" do
    it {
      output = gtm_head_snippet(config: Gsnippet::Configuration.new(
        container_id: "GTM-1234567",
        env_auth: "xxx",
        env_key: "env-1"
      ))

      is_asserted_by { output.include?("GTM-1234567") }
    }
  end

  describe "#gtm_head_snippet" do
    it {
      output = gtm_body_snippet(config: Gsnippet::Configuration.new(
        container_id: "GTM-1234567",
        env_auth: "xxx",
        env_key: "env-1"
      ))

      is_asserted_by { output.include?("GTM-1234567") }
    }

    context "when config is disabled" do
      it {
        output = gtm_body_snippet(config: Gsnippet::Configuration.new(
          container_id: nil,
          env_auth: nil,
          env_key: nil
        ))

        is_asserted_by { output.empty? }
      }
    end
  end
end
