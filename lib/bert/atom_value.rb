require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class AtomValue < FFI::Struct

      layout :length, :bert_atom_size_t,
             :name, :pointer

      def name
        self[:name].get_bytes(0,self[:length])
      end

      alias to_s name

      def to_sym
        name.to_sym
      end

    end
  end
end
