require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class RegexValue < FFI::Struct

      layout :length, :bert_regex_size_t,
             :data, :pointer,
             :options, :int

      def to_s
        self[:data].get_bytes(self[:length])
      end

      def to_regexp
        Regexp.new(self.to_s,self[:options])
      end

    end
  end
end
