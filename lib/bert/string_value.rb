require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class StringValue < FFI::Struct

      layout :length, :bert_string_size_t,
             :text, :string

      def text
        self[:text].get_bytes(self[:length])
      end

      def bytes
        self[:text].get_array_of_uint8(0,self[:length])
      end

      alias to_s text

    end
  end
end
