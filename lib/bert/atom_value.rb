require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class AtomValue < FFI::Struct

      layout :length, :bert_atom_size_t,
             :name, :string

      def name
        self[:name]
      end

      alias to_s name

      def to_sym
        name.to_sym
      end

    end
  end
end
