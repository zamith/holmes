module Gumbo
  class Wrapper
    include Gumbo::Helpers

    def initialize(@gumbo_output)
    end

    def print_tree
      print_tree_starting_on @gumbo_output.root.value
    end

    def all_with_tag(tag)
      search_node(@gumbo_output.root.value, -> (node : LibGumbo::GumboNode) {
        node.v.element.tag == Holmes.get_tag(tag)
      })
    end

    private def search_node(node, condition, result = [] of Node)
      return result unless node.type == LibGumbo::GumboNodeType::GUMBO_NODE_ELEMENT

      if condition.call(node)
        result << Node.new(node)
      else
        children = node.v.element.children

        0.upto(children.length - 1) do |index|
          search_node(node(children.data[index]), condition, result)
        end
      end

      result
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
