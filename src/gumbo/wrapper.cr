require "../holmes/node"
require "../selector_parser/*"

module Gumbo
  class Wrapper
    include Gumbo::Helpers

    def initialize(@gumbo_output); end

    def at(selector)
      SelectorParser::CSS.new(selector, self).parse
    end

    def all_with_tag(tag)
      search_node(@gumbo_output.root.value, -> (node : LibGumbo::GumboNode) {
        node.v.element.tag == Holmes.get_tag(tag)
      })
    end

    def all_with_id(id)
      search_node(@gumbo_output.root.value, -> (node : LibGumbo::GumboNode) {
        get_attribute(node, "id") == id
      })
    end

    def to_s(io)
      io << Gumbo::PrettyPrinter.new(@gumbo_output).print_tree
    end

    def inspect(io)
      to_s(io)
    end

    private def search_node(node, condition, result = [] of Holmes::Node)
      return result unless node.type == LibGumbo::GumboNodeType::GUMBO_NODE_ELEMENT

      if condition.call(node)
        result << Holmes::Node.new(node)
      else
        children = node.v.element.children

        0.upto(children.length - 1) do |index|
          search_node(node(children.data[index]), condition, result)
        end
      end

      result
    end
  end
end
