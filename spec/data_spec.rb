require 'bert/data'

require 'spec_helper'

describe BERT::Data do
  describe "nil" do
    before(:all) do
      @data = BERT::Data.create_nil()
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(nil)

      data.type.should == :nil
      data.destroy!
    end

    it "should create nil data" do
      @data.type.should == :nil
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == nil
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "boolean" do
    before(:all) do
      @data = BERT::Data.create_boolean(true)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(true)

      data.type.should == :boolean
      data.boolean.should == true
      data.destroy!
    end

    it "should create boolean data" do
      @data.type.should == :boolean
    end

    it "should provide access to the boolean value" do
      @data.boolean.should == true
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == true
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "int" do
    before(:all) do
      @data = BERT::Data.create_int(15)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(20)

      data.type.should == :int
      data.integer.should == 20
      data.destroy!
    end

    it "should create int data" do
      @data.type.should == :int
    end

    it "should provide access to the int value" do
      @data.integer.should == 15
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == 15
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "float" do
    before(:all) do
      @data = BERT::Data.create_float(0.5)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(0.1)

      data.type.should == :float
      data.float.should == 0.1
      data.destroy!
    end

    it "should create float data" do
      @data.type.should == :float
    end

    it "should provide access to the float value" do
      @data.float.should == 0.5
    end

    it "should be able to convert from BERT to ruby" do
      @data.to_ruby.should == 0.5
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "atom" do
    before(:all) do
      @data = BERT::Data.create_atom(:id)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(:name)

      data.type.should == :atom
      data.atom.name.should == 'name'
      data.destroy!
    end

    it "should create float data" do
      @data.type.should == :atom
    end

    it "should provide access to the atom value" do
      @data.atom.name.should == 'id'
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == :id
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "string" do
    before(:all) do
      @bytes = [104, 101, 108, 108, 111]
      @string = @bytes.pack('c*')
      @data = BERT::Data.create_string(@string)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby('word')

      data.type.should == :string
      data.string.text.should == 'word'
      data.destroy!
    end

    it "should create string data" do
      @data.type.should == :string
    end

    it "should provide access to the string value" do
      @data.string.text.should == @string
    end

    it "should provide access to the bytes of the string" do
      @data.string.bytes.should == @bytes
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == @string
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "bin" do
    before(:all) do
      @bytes = [131, 109, 1, 128, 1, 1, 65]
      @bin = @bytes.pack('c*') 
      @data = BERT::Data.create_bin(@bin)
    end

    it "should create bin data" do
      @data.type.should == :bin
    end

    it "should provide access to the bin value" do
      @data.bin.data.should == @bin
    end

    it "should provide access to the bytes of the bin value" do
      @data.bin.bytes.should == @bytes
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == @bin
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "tuple" do
    before(:each) do
      @data = BERT::Data.create_tuple(10)
    end

    it "should create tuple data" do
      @data.type.should == :tuple
    end

    it "should provide access to tuple values" do
      @data.tuple.elements.should == ([nil] * 10)
    end

    it "should allow random access" do
      @data.tuple[0].should == nil
    end

    it "should allow setting tuple values" do
      @data.tuple[1] = BERT::Data.create_int(2)

      @data.tuple[1].type.should == :int
      @data.tuple[1].integer.should == 2
    end

    it "should be able to converted to ruby" do
      @data.to_ruby.should == ([nil] * 10)
    end

    after(:each) do
      @data.destroy!
    end
  end

  describe "list" do
    before(:all) do
      @data = BERT::Data.create_list
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby([1,2])

      data.type.should == :list
      data.list[0].type.should == :int
      data.list[0].integer.should == 1
      data.list[1].type.should == :int
      data.list[1].integer.should == 2
      data.destroy!
    end

    it "should create list data" do
      @data.type.should == :list
    end

    it "should be able to converted to ruby" do
      @data.to_ruby.should == []
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "dict" do
    before(:all) do
      @data = BERT::Data.create_dict
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby({})

      data.type.should == :dict
      data.destroy!
    end

    it "should create dict data" do
      @data.type.should == :dict
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == {}
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "time" do
    before(:all) do
      @time = Time.now
      @data = BERT::Data.create_time(@time)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(@time)

      data.type.should == :time
      data.time.should == @time.to_i
      data.destroy!
    end

    it "should create time data" do
      @data.type.should == :time
    end

    it "should provide access to the time value" do
      @data.time.should == @time.to_i
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.to_i.should == @time.to_i
    end

    after(:all) do
      @data.destroy!
    end
  end

  describe "regex" do
    before(:all) do
      @regex = /hello\s+world/i
      @data = BERT::Data.create_regex(@regex.source,@regex.options)
    end

    it "should be able to convert from ruby to BERT" do
      data = BERT::Data.from_ruby(@regex)

      data.type.should == :regex
      data.regex.source.should == @regex.source
      data.regex.options.should == @regex.options
      data.destroy!
    end

    it "should create regex data" do
      @data.type.should == :regex
    end

    it "should provide access to the regex value" do
      @data.regex.source.should == 'hello\s+world'
    end

    it "should provide access to the regex options" do
      @data.regex.options.should == Regexp::IGNORECASE
    end

    it "should be able to converted from BERT to ruby" do
      @data.to_ruby.should == @regex
    end

    after(:all) do
      @data.destroy!
    end
  end
end
