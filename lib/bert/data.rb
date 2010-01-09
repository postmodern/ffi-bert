require 'bert/data_values'

require 'ffi'

module FFI
  module BERT
    class Data < FFI::Struct

      layout :type, :bert_data_type,
             :values, DataValues

      def Data.create_nil()
        unless (ptr = BERT.bert_data_create_nil())
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_boolean(value)
        ptr = if value == true
                BERT.bert_data_create_true();
              else
                BERT.bert_data_create_false();
              end

        unless ptr
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_int(integer)
        integer = integer.to_i

        unless (ptr = BERT.bert_data_create_int(integer))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_float(floating_point)
        floating_point = floating_point.to_f

        unless (ptr = BERT.bert_data_create_float(floating_point))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_atom(name)
        name = name.to_s

        unless (ptr = BERT.bert_data_create_atom(name))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_string(text)
        text = if text.kind_of?(Array)
                 text.join
               else
                 text.to_s
               end

        unless (ptr = BERT.bert_data_create_string(text))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_tuple(length)
        unless (ptr = BERT.bert_data_create_tuple(length))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_list()
        unless (ptr = BERT.bert_data_create_list())
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_dict()
        unless (ptr = BERT.bert_data_create_dict())
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_time(time)
        if time.kind_of?(Date)
          time = Time.utc(time.year,time.month,time.day)
        end

        unless (ptr = BERT.bert_data_create_time(time.to_i))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_regex(expr,options)
        expr = Regexp.new(expr) unless expr.kind_of?(Regexp)
        source = expr.source
        options = options.to_i

        unless (ptr = BERT.bert_data_create_regex(source,source.length,options))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Data.create_bin(data)
        data = if data.kind_of?(Array)
                 data.join
               else
                 data.to_s
               end

        unless (ptr = BERT.bert_data_create_bin(data,data.length))
          raise(RuntimeError,"malloc failed",caller)
        end

        return Data.new(ptr)
      end

      def Date.from_ruby(obj)
        case obj.class
        when Hash
          Data.create_dict()
          # TODO: append the elements of the Hash to the dict
        when Array
          Data.create_tuple(obj)
          # TODO: set the elements of the tuple
        when Regexp
          Data.create_regex(obj)
        when Symbol
          Data.create_atom(obj)
        when String
          Data.create_string(obj)
        when Time, Date
          Data.create_time(obj)
        when Float
          Data.create_float(obj)
        when Integer
          Data.create_integer(obj)
        when TrueClass
          Data.create_boolean(true)
        when FalseClass
          Data.create_boolean(false)
        when NilClass
          Data.create_nil()
        else
          raise(RuntimeError,"cannot convert #{obj.class} to BERT data",caller)
        end
      end

      def type
        self[:type]
      end

      def boolean
        self[:values][:boolean] if type == :bert_data_boolean
      end

      def integer
        self[:values][:integer] if type == :bert_data_int
      end

      def float
        self[:values][:floating_point] if type == :bert_data_float
      end

      def atom
        self[:values][:atom] if type == :bert_data_atom
      end

      def string
        self[:values][:string] if type == :bert_data_string
      end

      def bin
        self[:values][:bin] if type == :bert_data_bin
      end

      def tuple
        self[:values][:tuple] if type == :bert_data_tuple
      end

      def list
        self[:values][:list] if type == :bert_data_list
      end

      def dict
        self[:values][:dict] if type == :bert_data_dict
      end

      def time
        self[:values][:time] if type == :bert_data_time
      end

      def regex
        self[:values][:regex] if type == :bert_data_regex
      end

      def to_ruby
        case type
        when :bert_data_boolean
          if self.boolean == 1
            true
          else
            false
          end
        when :bert_data_integer
          self.integer
        when :bert_data_float
          self.float
        when :bert_data_atom
          self.atom.to_s
        when :bert_data_string
          self.string.to_s
        when :bert_data_tuple
          self.tuple.to_a
        when :bert_data_list
          self.list.to_a
        when :bert_data_dict
          self.dict.to_hash
        when :bert_data_bin
          self.bin.to_s
        when :bert_data_time
          Time.at(self.time)
        when :bert_data_regex
          self.self.regex.to_regexp
        when :bert_data_nil
          nil
        else
          raise(RuntimeError,"unknown bert_data_type #{type}",caller)
        end
      end

    end
  end
end
