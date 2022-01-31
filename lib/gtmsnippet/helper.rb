require "active_support/core_ext/string/strip"
require "active_support/core_ext/string/output_safety"
require_relative "./configuration"

module Gtmsnippet
  module Helper
    #
    # @return [String]
    #
    def gtm_head_snippet(config: Gtmsnippet::Configuration.new)
      return "" if config.disabled?

      <<-HTML.strip_heredoc.html_safe
        <!-- Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl+ '&gtm_auth=#{config.auth}&gtm_preview=#{config.preview}&gtm_cookies_win=x';f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','#{config.container}');</script>
        <!-- End Google Tag Manager -->
      HTML
    end

    #
    # @return [String]
    #
    def gtm_body_snippet(config: Gtmsnippet::Configuration.new)
      return "" if config.disabled?

      <<-HTML.strip_heredoc.html_safe
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{config.container}&gtm_auth=#{config.auth}&gtm_preview=#{config.preview}&gtm_cookies_win=x" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
      HTML
    end
  end
end
