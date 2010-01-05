require 'ffi'

module FFI
  module BERT
    class DictNode < FFI::Struct

      layout :key, :pointer,
             :value, :pointer,
             :next, :pointer

    end
  end
end
