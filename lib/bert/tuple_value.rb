require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class TupleValue < FFI::Struct

      layout :length, :bert_tuple_size_t,
             :elements, :pointer

      def elements
        self[:elements].get_array_of_pointer(0,self[:length]).map do |ptr|
          Data.new(ptr)
        end
      end

    end
  end
end
