class Node
  include Gumbo::Helpers
  def initialize(@gumbo_node); end

  def text
    io = StringIO.new
    0.upto(children(@gumbo_node).length - 1) do |index|
      child = node(children(@gumbo_node).data[index])
      if child.type == LibGumbo::GumboNodeType::GUMBO_NODE_TEXT
        io << String.new(child.v.text.text)
      end
    end
    io.to_s
  end
end
