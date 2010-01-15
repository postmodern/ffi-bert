require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class RegexValue < FFI::Struct

      layout :length, :bert_regex_size_t,
             :data, :pointer,
             :options, :int

      def source
        self[:data].get_bytes(0,self[:length])
      end

      def options
        self[:options]
      end

      alias to_s source

      def to_regexp
        Regexp.new(source,options)
      end

    end
  end
end
