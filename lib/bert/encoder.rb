require 'bert/errno'

module FFI
  module BERT
    class Encoder

      include Errno

      def initialize(ptr)
        @ptr = ptr
      end

      def push(data)
        catch_error BERT.bert_encoder_push(self,data)
        return self
      end

      def <<(data)
        data = Data.from_ruby(data)

        push(data)

        data.destroy!
        return self
      end

      def to_ptr
        @ptr
      end

    end
  end
end
