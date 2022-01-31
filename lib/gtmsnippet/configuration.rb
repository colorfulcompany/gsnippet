module Gtmsnippet
  class Configuration
    attr_accessor :container, :auth, :preview

    #
    # @param [String] container
    # @param [String] auth
    # @param [String] preview
    #
    def initialize(
        container: ENV["GTM_CONTAINER"],
        auth: ENV["GTM_AUTH"],
        preview: ENV["GTM_PREVIEW"]
      )
      @container = container
      @auth = auth
      @preview = preview
    end

    #
    # @return [Boolean]
    #
    def disabled?
      container.nil? || auth.nil? || preview.nil?
    end
  end
end
