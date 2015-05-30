require "../spec_helper"

describe Gumbo::Wrapper do
  context "#all_with_tag" do
    it "finds all the p tags" do
      html = "<div><p>Paragraph 1</p><p>Paragraph 2</p></div>"

      Holmes.parse(html).all_with_tag("p").size.should eq 2
    end
  end

  context "#text" do
    it "gets text for a p tag" do
      html = "<div><p>Paragraph 1</p></div>"

      Holmes.parse(html).all_with_tag("p").first.text.should eq "Paragraph 1"
    end
  end
end
