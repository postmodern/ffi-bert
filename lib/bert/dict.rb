require 'bert/dict_node'

require 'ffi'

module FFI
  module BERT
    class Dict < FFI::Struct

      layout :head, :pointer,
             :tail, :pointer

    end
  end
end
