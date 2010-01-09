require 'bert/errno'
require 'bert/list_node'
require 'bert/ffi'

require 'ffi'

module FFI
  module BERT
    class List < FFI::Struct

      include Enumerable
      include Errno

      layout :head, :pointer,
             :tail, :pointer

      def each(&block)
        head_ptr = self[:head]
        return self if head_ptr.null?

        next_node = ListNode.new(head_ptr)

        while next_node
          block.call(next_node.data) if block
          next_node = next_node.next
        end

        return self
      end

      def <<(data)
        if BERT.bert_list_append(self,data) == Errno::MALLOC
          raise_error(Errno::MALLOC)
        end

        return self
      end

      def to_a
        Enumerator.new(self,:each).to_a
      end

    end
  end
end
