require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class AtomValue < FFI::Struct

      layout :length, :bert_atom_size_t,
             :name, :string

    end
  end
end
