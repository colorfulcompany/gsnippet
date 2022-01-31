require "cgi"

module Gsnippet
  module Tagmanager
    class Parameter
      def initialize(url)
        @params = CGI::parse(url)
      end

      def container_id
        @params["id"][0]
      end

      def env_auth
        @params["gtm_auth"][0]
      end

      def env_key
        @params["gtm_preview"][0]
      end
    end
  end
end
