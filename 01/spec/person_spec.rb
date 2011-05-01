# -*- encoding: utf-8 -*-
require 'rspec'
require File.expand_path('../lib/person', File.dirname(__FILE__))

describe "Person" do
  it "Personには名前、性別、生年月日を設定できるべき" do
    shimao = Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
    shimao.name.should == "shimao"
    shimao.gender.should == :male
    shimao.birthday.should == Date.new(2007, 7, 31)
  end
  it "Person#age で年齢を取得できるべき" do
    shimao = Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
    Date.stub!(:today) { Date.new(2011, 7, 30)}
    shimao.age.should == 3
    Date.stub!(:today) { Date.new(2011, 7, 31)}
    shimao.age.should == 4
  end
end
