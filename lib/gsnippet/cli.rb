require "thor"
require "open-uri"

module Gsnippet
  module Tagmanager
    class CLI < Thor
      desc "extract [URL]", "Extract GTM parameters from the specified URL."
      def extract(url)
        parameter = Tagmanager::Parameter.new(url)
        puts "✔️ Extract GTM parameters from the specified URL!"
        puts "#{Tagmanager::Configuration::CONTAINER_ID_VAR}=#{parameter.container_id}"
        puts "#{Tagmanager::Configuration::ENV_AUTH_VAR}=#{parameter.env_auth}"
        puts "#{Tagmanager::Configuration::ENV_KEY_VAR}=#{parameter.env_key}"
      end

      desc "confirm [URL] [HEAD] [BODY]", "Confirm if snippets on the specified page are match with given HTML."
      def confirm(url, head, body)
        confirmation = Tagmanager::Confirmation.new(
          html: URI.open(url).read,
          head_snippet: File.read(head),
          body_snippet: File.read(body)
        )

        unless confirmation.head?
          puts "❌ Head snippets on the specified page are match with given HTML!"
        end

        unless confirmation.body?
          puts "❌ Body snippets on the specified page are not match with given HTML!"
        end

        if confirmation.all?
          puts "✔️ All snippets on the specified page are match with given HTML!"
        end
      end
    end
  end

  class CLI < Thor
    def self.exit_on_failure
      false
    end

    register(Tagmanager::CLI, 'tagmanager', 'tagmanager <command>', 'Manage Google Tag Manager')
  end
end
