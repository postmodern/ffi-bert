require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class RegexValue < FFI::Struct

      layout :length, :bert_regex_size_t,
             :data, :pointer,
             :options, :int

    end
  end
end
