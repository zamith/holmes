require "../spec_helper"

describe Holmes::Node do
  context "#text" do
    it "gets text for a p tag" do
      html = "<div><p>Paragraph 1</p></div>"

      Holmes.parse(html).all_with_tag("p").first.text.should eq "Paragraph 1"
    end
  end
end
