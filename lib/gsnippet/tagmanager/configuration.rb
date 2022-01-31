module Gsnippet
  module Tagmanager
    class Configuration
      attr_accessor :container_id, :env_auth, :env_key

      CONTAINER_ID_VAR = "GTM_CONTAINER_ID"
      ENV_AUTH_VAR = "GTM_ENV_AUTH"
      ENV_KEY_VAR = "GTM_ENV_KEY"

      #
      # @param [String] container_id
      # @param [String] env_auth
      # @param [String] env_key
      #
      def initialize(
          container_id: ENV["GTM_CONTAINER_ID"],
          env_auth: ENV["GTM_ENV_AUTH"],
          env_key: ENV["GTM_ENV_KEY"]
        )
        @container_id = container_id
        @env_auth = env_auth
        @env_key = env_key
      end

      #
      # @return [Boolean]
      #
      def disabled?
        container_id.nil? || env_auth.nil? || env_key.nil?
      end
    end
  end
end
