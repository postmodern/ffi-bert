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
          unless time.respond_to?(:to_time)
            raise(StandardError,"cannot convert Date into Time, Date#to_time method required",caller)
          end

          time = time.to_time
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

    end
  end
end
