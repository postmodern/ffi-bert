require 'bert/types'
require 'bert/ffi'

require 'ffi'

module FFI
  module BERT
    class TupleValue < FFI::Struct

      layout :length, :bert_tuple_size_t,
             :elements, :pointer

      def length
        self[:length]
      end

      def elements
        self[:elements].get_array_of_pointer(0,self[:length]).map do |ptr|
          Data.new(ptr) unless ptr.null?
        end
      end

      def [](key)
        if key.kind_of?(Integer)
          if (key >= 0 && key < self[:length])
            ptr = self[:elements].get_pointer(key)
            return Data.new(ptr) unless ptr.null?
          end
        else
          return super(key)
        end
      end

      def []=(key,value)
        if key.kind_of?(Integer)
          if (key >= 0 && key < self[:length])
            ptr = self[:elements].get_pointer(key)
            BERT.bert_data_destroy(ptr) unless ptr.null?

            return self[:elements].put_pointer(key,value)
          end
        else
          return super(key,value)
        end
      end

      def to_a
        elements.map { |data| data.to_ruby if data }
      end

    end
  end
end
