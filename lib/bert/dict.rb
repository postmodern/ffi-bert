require 'bert/dict_node'
require 'bert/errno'
require 'bert/ffi'

require 'ffi'

module FFI
  module BERT
    class Dict < FFI::Struct

      include Enumerable
      include Errno

      layout :head, :pointer,
             :tail, :pointer

      def []=(key,value)
        if BERT.bert_dict_append(self,key,value) == Errno::MALLOC
          raise_error(Errno::MALLOC)
        end

        return value
      end

      def each(&block)
        head_ptr = self[:head]
        return self if head_ptr.null?

        next_node = DictNode.new(head_ptr)

        while next_node
          block.call(next_node.key,next_node.value) if block
          next_node = next_node.next
        end

        return self
      end

      def empty?
        self[:head].null?
      end

      def to_hash
        new_hash = {}

        each do |key,value|
          new_hash[key.to_ruby] = value.to_ruby
        end

        return new_hash
      end

    end
  end
end
