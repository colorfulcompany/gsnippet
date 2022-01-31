RSpec.describe Gsnippet::Tagmanager::Confirmation do
  describe "#result" do
    context "incorrect HTML" do
      confirmation = Gsnippet::Tagmanager::Confirmation.new(
        html: File.read(File.join(__dir__, "../../fixtures/incorrect.html")),
        head_snippet: File.read(File.join(__dir__, "../../fixtures/head_snippet.html")),
        body_snippet: File.read(File.join(__dir__, "../../fixtures/body_snippet.html"))
      )

      it_is_asserted_by { confirmation.head? == false }
      it_is_asserted_by { confirmation.body? == false }
    end

    context "correct HTML" do
      confirmation = Gsnippet::Tagmanager::Confirmation.new(
        html: File.read(File.join(__dir__, "../../fixtures/correct.html")),
        head_snippet: File.read(File.join(__dir__, "../../fixtures/head_snippet.html")),
        body_snippet: File.read(File.join(__dir__, "../../fixtures/body_snippet.html"))
      )

      it_is_asserted_by { confirmation.head? == true }
      it_is_asserted_by { confirmation.body? == true }
    end
  end
end
