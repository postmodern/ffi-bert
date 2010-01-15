require 'ffi'

module FFI
  module BERT
    extend FFI::Library

    typedef :uint, :size_t
    typedef :int, :ssize_t

    typedef :uint, :time_t

    typedef :uint16, :bert_atom_size_t
    typedef :uint32, :bert_string_size_t
    typedef :uint32, :bert_bin_size_t
    typedef :bert_bin_size_t, :bert_regex_size_t
    typedef :uint32, :bert_tuple_size_t
    typedef :uint32, :bert_list_size_t

    enum :bert_data_type, [
      :none,
      :boolean,
      :int,
      :float,
      :atom,
      :string,
      :tuple,
      :list,
      :dict,
      :bin,
      :time,
      :regex,
      :nil
    ]

    callback :bert_read_func, [:pointer, :size_t, :pointer], :ssize_t
    callback :bert_write_func, [:pointer, :size_t, :pointer], :ssize_t
  end
end
