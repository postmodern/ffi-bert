require 'bert/ffi'

module FFI
  module BERT
    module Errno
      MAX = -9
      BIGNUM = -8
      MALLOC = -7
      WRITE = -6
      READ = -5
      SHORT_WRITE = -4
      SHORT_READ = -3
      EMPTY = -2
      INVALID = -1
      SUCCESS = 0

      EXCEPTIONS = {
        MAX => RuntimeError,
        BIGNUM => StandardError,
        MALLOC => RuntimeError,
        WRITE => SystemCallError,
        READ => SystemCallError,
        SHORT_WRITE => RuntimeError,
        SHORT_READ => RuntimeError,
        EMPTY => RuntimeError,
        INVALID => RuntimeError,
        SUCCESS => nil
      }

      def Errno.strerror(code)
        BERT.bert_strerror(code.to_i)
      end

      def Errno.raise_error(code)
        code = code.to_i

        if (excp = Errno::EXCEPTIONS[code])
          raise(excp,Errno.strerror(code),caller)
        end
      end

      def raise_error(code)
        Errno.raise_error(code)
      end

      def catch_error(code)
        unless code == Errno::SUCCESS
          Errno.raise_error(code)
        end

        return code
      end
    end
  end
end
