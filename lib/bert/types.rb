require 'ffi'

module FFI
  module BERT
    extend FFI::Library

    typedef :uint, :size_t
    typedef :int, :ssize_t

    typedef :uint, :time_t

    enum :bert_data_type, [
      :bert_data_none,
      :bert_data_boolean,
      :bert_data_int,
      :bert_data_float,
      :bert_data_atom,
      :bert_data_string,
      :bert_data_tuple,
      :bert_data_list,
      :bert_data_dict,
      :bert_data_bin,
      :bert_data_time,
      :bert_data_regex,
      :bert_data_nil
    ]

    callback :bert_read_func, [:pointer, :size_t, :pointer], :ssize_t
    callback :bert_write_func, [:pointer, :size_t, :pointer], :ssize_t
  end
end
