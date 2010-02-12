# ffi-bert

* [github.com/postmodern/ffi-bert](http://github.com/postmodern/ffi-bert/)
* [github.com/postmodern/ffi-bert/issues](http://github.com/postmodern/ffi-bert/issues)
* [github.com/postmodern/libBERT/issues](http://github.com/postmodern/libBERT/issues)
* Postmodern (postmodern.mod3 at gmail.com)

## Description

FFI bindings to libBERT, a library for the encoding and decoding of BERT
data.

## Features

* Supports encoding/decoding of:
  * Integers.
  * Floating point numbers.
  * Atoms.
  * Strings.
  * Binary data.
  * Tuples.
  * Lists.
  * Complex types:
    * Nil.
    * Boolean True and False values.
    * Dictionaries.
    * Time values.
    * Regular Expressions.
* Supports buffered, streaming or callback-based reading/writing of
  BERT data.
* Supports converting between BERT data and Ruby native objects.

## Requirements

* [libBERT](http://github.com/postmodern/libBERT) >= 0.1.0
* [ffi](http://github.com/ffi/ffi) >= 0.6.0

## Install

    $ sudo gem install ffi-bert

## License

See {file:LICENSE.txt} for license information.

