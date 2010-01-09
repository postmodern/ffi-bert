require 'bert/errno'
require 'bert/list_node'
require 'bert/ffi'

require 'ffi'

module FFI
  module BERT
    class List < FFI::Struct

      include Errno

      layout :head, :pointer,
             :tail, :pointer

      def <<(data)
        if BERT.bert_list_append(self,data) == Errno::MALLOC
          raise_error(Errno::MALLOC)
        end

        return self
      end

    end
  end
end
