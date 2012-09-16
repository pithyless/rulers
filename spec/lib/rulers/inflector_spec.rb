require 'spec_helper'

describe 'Inflector' do

  subject { Rulers::Inflector }

  describe '::underscore' do

    { 'ActiveModel' => 'active_model',
      'ActiveModel::Errors' => 'active_model/errors',
      'SSLError' => 'ssl_error',
      'Ruby-Magic' => 'ruby_magic'
    }.each do |key, val|
      it '#{key} underscores to #{val}' do
        subject.underscore(key).should == val
        key.public_send(:underscore).should == val
      end
    end
  end

end
