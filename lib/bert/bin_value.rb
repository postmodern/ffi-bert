require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class BinValue < FFI::Struct

      layout :length, :bert_bin_size_t,
             :data, :pointer

      def data
        self[:data].get_bytes(0,self[:length])
      end

      def bytes
        self[:data].get_array_of_uint8(0,self[:length])
      end

      alias to_s data

    end
  end
end
