RSpec.describe Gtmsnippet::Helper do
  include Gtmsnippet::Helper

  describe "#gtm_head_snippet" do
    it {
      output = gtm_head_snippet(config: Gtmsnippet::Configuration.new(
        container: "GTM-1234567",
        auth: "xxx",
        preview: "env-1"
      ))

      is_asserted_by { output.include?("GTM-1234567") }
    }
  end

  describe "#gtm_head_snippet" do
    it {
      output = gtm_body_snippet(config: Gtmsnippet::Configuration.new(
        container: "GTM-1234567",
        auth: "xxx",
        preview: "env-1"
      ))

      is_asserted_by { output.include?("GTM-1234567") }
    }

    context "when config is disabled" do
      it {
        output = gtm_body_snippet(config: Gtmsnippet::Configuration.new(
          container: nil,
          auth: nil,
          preview: nil
        ))

        is_asserted_by { output.empty? }
      }
    end
  end
end
