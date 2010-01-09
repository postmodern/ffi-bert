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

      def Errno.strerror(code)
        BERT.bert_strerror(code.to_i)
      end
    end
  end
end
