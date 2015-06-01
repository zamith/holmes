module Gumbo
  module Helpers
    private def node(node_pointer)
      (node_pointer as LibGumbo::GumboNode*).value
    end

    private def children(node)
      node.v.element.children
    end

    private def text(string_piece)
      String.new string_piece.data
    end

    private def get_attribute(node, attr_name)
      attrs = node.v.element.attributes
      if attrs.length > 0
        String.new(LibGumbo.gumbo_get_attribute(pointerof(attrs), attr_name).value.value)
      else
        ""
      end
    end
  end
end
