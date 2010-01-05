require 'bert/data_values'

require 'ffi'

module FFI
  module BERT
    class Data < FFI::Struct

      layout :type, :bert_data_type,
             :values, DataValues

    end
  end
end
