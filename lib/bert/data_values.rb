require 'bert/atom_value'
require 'bert/string_value'
require 'bert/bin_value'
require 'bert/tuple_value'
require 'bert/list'
require 'bert/dict'
require 'bert/regex_value'
require 'bert/types'

require 'ffi'

module FFI
  module BERT
    class DataValues < FFI::Union

      layout :boolean, :uint,
             :integer, :int64,
             :floating_point, :double,
             :atom, AtomValue,
             :string, StringValue,
             :bin, BinValue,
             :tuple, TupleValue,
             :list, :pointer,
             :dict, :pointer,
             :time, :time_t,
             :regex, RegexValue

      def boolean
        if self[:boolean] == 1
          return true
        else
          return false
        end
      end

      def integer
        self[:integer]
      end

      def floating_point
        self[:floating_point]
      end

      def atom
        self[:atom]
      end

      def string
        self[:string]
      end

      def bin
        self[:bin]
      end

      def tuple
        self[:tuple]
      end

      def list
        ptr = self[:list]

        return List.new(ptr) unless ptr.null?
      end

      def dict
        ptr = self[:dict]

        return Dict.new(ptr) unless ptr.null?
      end

      def time
        self[:time]
      end

      def regex
        self[:regex]
      end

    end
  end
end
