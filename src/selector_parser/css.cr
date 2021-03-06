require "../holmes/node"

module SelectorParser
  class CSS
    def initialize(@selector, @document); end

    def parse
      case @selector
      when /\#([_A-Za-z0-9-]+|[^\0-\177]+|\\[0-9A-Fa-f]{1,6}(\r\n|[\s])?+|\\[^\n\r\f0-9A-Fa-f]+)/
        @document.all_with_id($1)
      else
        [] of Holmes::Node
      end
    end
  end
end
