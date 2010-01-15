require 'bert/types'
require 'bert/ffi'

require 'ffi'

module FFI
  module BERT
    class Tuple < FFI::Struct

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
          ptr = BERT.bert_tuple_get(self,key)
          return Data.new(ptr) unless ptr.null?
        else
          return super(key)
        end
      end

      def []=(key,value)
        if key.kind_of?(Integer)
          if BERT.bert_tuple_set(self,key,value) == 1
            return value
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
