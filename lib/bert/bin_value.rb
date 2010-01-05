require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class BinValue < FFI::Struct

      layout :length, :bert_bin_size_t,
             :data, :pointer

    end
  end
end
