require 'bert/types'

require 'ffi'

module FFI
  module BERT
    extend FFI::Library

    ffi_lib 'BERT'

    attach_function :bert_version, [], :string

    attach_function :bert_strerror, [:int], :string

    attach_function :bert_list_create, [], :pointer
    attach_function :bert_list_append, [:pointer, :pointer], :int
    attach_function :bert_list_destroy, [:pointer], :void

    attach_function :bert_dict_create, [], :pointer
    attach_function :bert_dict_append, [:pointer, :pointer, :pointer], :int
    attach_function :bert_dict_destroy, [:pointer], :void

    attach_function :bert_data_create_nil, [], :pointer
    attach_function :bert_data_create_true, [], :pointer
    attach_function :bert_data_create_false, [], :pointer
    attach_function :bert_data_create_int, [:int], :pointer
    attach_function :bert_data_create_float, [:double], :pointer
    attach_function :bert_data_create_atom, [:string], :pointer
    attach_function :bert_data_create_string, [:string], :pointer
    attach_function :bert_data_create_tuple, [:uint], :pointer
    attach_function :bert_data_create_list, [], :pointer
    attach_function :bert_data_create_dict, [], :pointer
    attach_function :bert_data_create_time, [:uint], :pointer
    attach_function :bert_data_create_regex, [:string, :uint, :int], :pointer
    attach_function :bert_data_create_bin, [:pointer, :uint], :pointer
    attach_function :bert_data_sizeof, [:pointer], :size_t
    attach_function :bert_data_strequal, [:pointer, :string], :int
    attach_function :bert_data_destroy, [:pointer], :void

    attach_function :bert_decoder_create, [], :pointer
    attach_function :bert_decoder_stream, [:pointer, :int], :void
    attach_function :bert_decoder_callback, [:pointer, :bert_read_func, :pointer], :void
    attach_function :bert_decoder_buffer, [:pointer, :pointer, :size_t], :void
    attach_function :bert_decoder_pull, [:pointer, :pointer], :int
    attach_function :bert_decoder_total, [], :size_t
    attach_function :bert_decoder_destroy, [:pointer], :void

    attach_function :bert_encoder_create, [], :pointer
    attach_function :bert_encoder_stream, [:pointer, :int], :void
    attach_function :bert_encoder_buffer, [:pointer, :pointer, :size_t], :void
    attach_function :bert_encoder_callback, [:pointer, :bert_write_func, :pointer], :void
    attach_function :bert_encoder_push, [:pointer, :pointer], :int
    attach_function :bert_encoder_total, [], :size_t
    attach_function :bert_encoder_destroy, [:pointer], :void
  end
end
