RSpec.describe Gsnippet::Parameter do
  describe do
    parameter = Gsnippet::Parameter.new("https://tagassistant.google.com/#source=TAG_MANAGER&id=GTM-1234567&gtm_auth=xxx&gtm_preview=env-1")

    it_is_asserted_by { parameter.container_id == "GTM-1234567" }
    it_is_asserted_by { parameter.env_auth == "xxx" }
    it_is_asserted_by { parameter.env_key == "env-1" }
  end
end
