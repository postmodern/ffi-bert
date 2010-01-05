require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class StringValue < FFI::Struct

      layout :length, :bert_string_size_t,
             :text, :string

    end
  end
end
