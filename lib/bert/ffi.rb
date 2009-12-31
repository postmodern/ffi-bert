require 'ffi'

module FFI
  module BERT
    extend FFI::Library

    ffi_lib 'BERT'
  end
end
