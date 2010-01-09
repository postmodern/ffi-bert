require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class AtomValue < FFI::Struct

      layout :length, :bert_atom_size_t,
             :name, :string

      def name
        self[:name].get_bytes(self[:length])
      end

      alias to_s name

    end
  end
end
