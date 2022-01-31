require "nokogiri"
require "active_support/core_ext/string/filters"

module Gsnippet
  module Tagmanager
    class Confirmation
      def initialize(html:, head_snippet:, body_snippet:)
        @html = html.squish
        @head_snippet = head_snippet.squish
        @body_snippet = body_snippet.squish
      end

      def all?
        head? && body?
      end

      def head?
        @html.include?(@head_snippet)
      end

      def body?
        @html.include?(@body_snippet)
      end
    end
  end
end
