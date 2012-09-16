require 'spec_helper'

class QuotesController < Rulers::Controller; end

describe 'Router' do

  subject { Rulers::Router.new }

  describe '#get_controller_and_action' do
    let(:klass) { QuotesController }

    it 'matches /' do
      env = { 'PATH_INFO' => '/' }
      -> { subject.controller_and_action(env) }.should raise_error(Rulers::RoutingError)
    end

    it 'matches /controller' do
      env = { 'PATH_INFO' => '/quotes' }
      subject.controller_and_action(env).should == [klass, 'index']
    end

    it 'matches /controller/' do
      env = { 'PATH_INFO' => '/quotes/' }
      subject.controller_and_action(env).should == [klass, 'index']
    end

    it 'matches /controller/action' do
      env = { 'PATH_INFO' => '/quotes/random' }
      subject.controller_and_action(env).should == [klass, 'random']
    end

    it 'matches /controller/action/' do
      env = { 'PATH_INFO' => '/quotes/random/' }
      subject.controller_and_action(env).should == [klass, 'random']
    end

    it 'matches /controller/action/extra?foo=bar' do
      env = { 'PATH_INFO' => '/quotes/random/sort?by=best' }
      subject.controller_and_action(env).should == [klass, 'random']
    end
  end

end

