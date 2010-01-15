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

      def list
        ptr = self[:list]

        return List.new(ptr) unless ptr.null?
      end

      def dict
        ptr = self[:dict]

        return Dict.new(ptr) unless ptr.null?
      end

    end
  end
end
