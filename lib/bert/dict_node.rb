require 'bert/data'

require 'ffi'

module FFI
  module BERT
    class DictNode < FFI::Struct

      layout :key, :pointer,
             :value, :pointer,
             :next, :pointer

      def key
        Data.new(self[:key])
      end

      def value
        Data.new(self[:value])
      end

      def next
        ptr = self[:next]

        return DictNode.new(ptr) unless ptr.null?
      end

    end
  end
end
