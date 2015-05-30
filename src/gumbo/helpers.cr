module Gumbo
  module Helpers
    private def node(node_pointer)
      (node_pointer as LibGumbo::GumboNode*).value
    end

    private def children(node)
      node.v.element.children
    end
  end
end
