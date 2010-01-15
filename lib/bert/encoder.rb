require 'bert/errno'

module FFI
  module BERT
    class Encoder < FFI::ManagedStruct

      include Errno

      def initialize(ptr)
        @ptr = ptr
      end

      def self.release(ptr)
        BERT.bert_encoder_destroy(ptr)
      end

      def Encoder.buffer(length,&block)
        encoder = Encoder.create
        buffer = FFI::Buffer.new(length)

        BERT.bert_encoder_buffer(encoder,buffer)

        block.call(encoder) if block
        return buffer
      end

      def Encoder.stream(io,&block)
        callback_proc = Proc.new { |data,length,user_data|
          io.write(data.get_string(0,length))
        }

        Encoder.callback(callback_proc,&block)
      end

      def Encoder.callback(callback_proc,&block)
        encoder = Encoder.create

        BERT.bert_encoder_callback(encoder,callback_proc,nil)

        block.call(encoder) if block
        return nil
      end

      def length
        BERT.bert_encoder_total(self)
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

      protected

      def Encoder.create
        unless (ptr = BERT.bert_encoder_create())
          Errno.raise_error(Errno::MALLOC)
        end

        return Encoder.new(ptr)
      end

    end
  end
end
