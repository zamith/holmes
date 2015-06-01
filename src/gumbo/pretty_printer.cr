require "./helpers"

module Gumbo
  class PrettyPrinter
    include Gumbo::Helpers

    def initialize(@gumbo_output); end

    def print_tree
      print_tree_starting_on @gumbo_output.root.value
    end

    private def print_tree_starting_on(node)
      return unless node.type == LibGumbo::GumboNodeType::GUMBO_NODE_ELEMENT
      puts node.v.element.tag
      children = children(node)
      0.upto(children.length - 1) do |index|
        print_tree_starting_on(node(children.data[index]))
      end
    end
  end
end
