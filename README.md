# ffi-bert

* [github.com/postmodern/ffi-bert](http://github.com/postmodern/ffi-bert/)
* [github.com/postmodern/ffi-bert/issues](http://github.com/postmodern/ffi-bert/issues)
* [github.com/postmodern/libBERT/issues](http://github.com/postmodern/libBERT/issues)
* Postmodern (postmodern.mod3 at gmail.com)

## DESCRIPTION:

FFI bindings to libBERT, a library for the encoding and decoding of BERT
data.

## FEATURES/PROBLEMS:

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

## REQUIREMENTS:

* [libBERT](http://github.com/postmodern/libBERT) >= 0.1.0
* [ffi](http://github.com/ffi/ffi) >= 0.6.0

## INSTALL:

    $ sudo gem install ffi-bert

## LICENSE:

See {file:LICENSE.txt} for license information.

