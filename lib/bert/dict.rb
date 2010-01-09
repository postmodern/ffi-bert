require 'bert/dict_node'
require 'bert/errno'

require 'ffi'

module FFI
  module BERT
    class Dict < FFI::Struct

      include Errno

      layout :head, :pointer,
             :tail, :pointer

      def []=(key,value)
        if BERT.bert_dict_append(self,key,value) == Errno::MALLOC
          raise_error(Errno::MALLOC)
        end

        return value
      end

    end
  end
end
