require 'ffi'

module FFI
  module BERT
    class ListNode < FFI::Struct

      layout :data, :pointer,
             :next, :pointer

    end
  end
end
