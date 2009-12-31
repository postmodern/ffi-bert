require 'ffi'

module FFI
  module BERT
    extend FFI::Library

    typedef :uint, :size_t
    typedef :int, :ssize_t

    callback :bert_read_func, [:pointer, :size_t, :pointer], :ssize_t
    callback :bert_write_func, [:pointer, :size_t, :pointer], :ssize_t
  end
end
