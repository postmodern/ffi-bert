require 'bert/data'

require 'ffi'

module FFI
  module BERT
    class ListNode < FFI::Struct

      layout :data, :pointer,
             :next, :pointer

      def data
        Data.new(self[:data])
      end

      def next
        ptr = self[:next]

        return ListNode.new(ptr) unless ptr.null?
      end

    end
  end
end
