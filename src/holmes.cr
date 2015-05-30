require "gumbocr"
require "./gumbo/*"
require "./holmes/*"
require "http/client"

module Holmes
  def self.get_tag(tagname)
    LibGumbo.gumbo_tag_enum(tagname)
  end

  def self.parse(buffer)
    Gumbo::Wrapper.new(LibGumbo.gumbo_parse(buffer).value)
  end

  def self.open(uri)
    HTTP::Client.get(uri).body
  end
end
