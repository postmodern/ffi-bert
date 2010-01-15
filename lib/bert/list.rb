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

      def [](key)
        if key.kind_of?(Integer)
          ptr = BERT.bert_list_get(self,key)
          return Data.new(ptr) unless ptr.null?
        else
          return super(key)
        end
      end

      def []=(key,value)
        if key.kind_of?(Integer)
          if BERT.bert_list_set(key,value) == 1
            return value
          end
        else
          return super(key,value)
        end
      end

      def <<(data)
        if BERT.bert_list_append(self,data) == Errno::MALLOC
          raise_error(Errno::MALLOC)
        end

        return self
      end

      def empty?
        self[:head].null?
      end

      def to_a
        array = []

        each { |data| array << data }
        return array
      end

    end
  end
end
