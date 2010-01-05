require 'bert/list_node'

require 'ffi'

module FFI
  module BERT
    class List < FFI::Struct

      layout :head, :pointer,
             :tail, :pointer

    end
  end
end
