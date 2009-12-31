require 'bert/version'

require 'spec_helper'

describe BERT do
  it "should have a VERSION constant" do
    BERT.const_defined?('VERSION').should == true
  end
end
