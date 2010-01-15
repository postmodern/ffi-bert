require 'bert/data_values'

require 'ffi'

module FFI
  module BERT
    class Data < FFI::Struct

      include Errno

      layout :type, :bert_data_type,
             :values, DataValues

      def Data.create_nil()
        unless (ptr = BERT.bert_data_create_nil())
          Errno.raise_error(Errno::MALLOC)
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
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_int(integer)
        integer = integer.to_i

        unless (ptr = BERT.bert_data_create_int(integer))
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_float(floating_point)
        floating_point = floating_point.to_f

        unless (ptr = BERT.bert_data_create_float(floating_point))
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_atom(name)
        name = name.to_s

        unless (ptr = BERT.bert_data_create_atom(name))
          Errno.raise_error(Errno::MALLOC)
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
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_tuple(length)
        unless (ptr = BERT.bert_data_create_tuple(length))
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_list()
        unless (ptr = BERT.bert_data_create_list())
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_dict()
        unless (ptr = BERT.bert_data_create_dict())
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_time(time)
        if time.kind_of?(Date)
          time = Time.utc(time.year,time.month,time.day)
        end

        unless (ptr = BERT.bert_data_create_time(time.to_i))
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.create_regex(expr,options)
        expr = Regexp.new(expr) unless expr.kind_of?(Regexp)
        source = expr.source
        options = options.to_i

        unless (ptr = BERT.bert_data_create_regex(source,source.length,options))
          Errno.raise_error(Errno::MALLOC)
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
          Errno.raise_error(Errno::MALLOC)
        end

        return Data.new(ptr)
      end

      def Data.from_ruby(obj)
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
        if type == :boolean
          if self[:values][:boolean] == 1
            return true
          else
            return false
          end
        end
      end

      def integer
        self[:values][:integer] if type == :int
      end

      def float
        self[:values][:floating_point] if type == :float
      end

      def atom
        self[:values][:atom] if type == :atom
      end

      def string
        self[:values][:string] if type == :string
      end

      def bin
        self[:values][:bin] if type == :bin
      end

      def tuple
        self[:values][:tuple] if type == :tuple
      end

      def list
        self[:values][:list] if type == :list
      end

      def dict
        self[:values][:dict] if type == :dict
      end

      def time
        self[:values][:time] if type == :time
      end

      def regex
        self[:values][:regex] if type == :regex
      end

      def to_ruby
        case type
        when :boolean
          self.boolean
        when :int
          self.integer
        when :float
          self.float
        when :atom
          self.atom.to_s
        when :string
          self.string.to_s
        when :tuple
          self.tuple.to_a
        when :list
          self.list.to_a
        when :dict
          self.dict.to_hash
        when :bin
          self.bin.to_s
        when :time
          Time.at(self.time)
        when :regex
          self.self.regex.to_regexp
        when :nil
          nil
        else
          raise(RuntimeError,"unknown bert_data_type #{type}",caller)
        end
      end

      def destroy!
        BERT.bert_data_destroy(self)
      end

    end
  end
end
