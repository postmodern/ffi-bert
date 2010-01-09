require 'ffi'

module FFI
  module BERT
    class DictNode < FFI::Struct

      layout :key, :pointer,
             :value, :pointer,
             :next, :pointer

      def next
        ptr = self[:next]

        return DictNode.new(ptr) unless ptr.null?
      end

    end
  end
end
