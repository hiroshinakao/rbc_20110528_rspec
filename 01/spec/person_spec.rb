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

  it "Person#male? で男性の判断ができるべき" do
    shimao =  Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
    shimao.should be_male
    shimako =  Person.new(name: "shimako", gender: :female, birthday: Date.new(2007, 8, 1))
    shimako.should_not be_male
  end

  it "Person#female? で女性の判断ができるべき" do
    shimao =  Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
    shimao.should_not be_female
    shimako =  Person.new(name: "shimako", gender: :female, birthday: Date.new(2007, 8, 1))
    shimako.should be_female
  end

  it "Person#age で年齢を取得できるべき" do
    shimao = Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
    Date.stub!(:today) { Date.new(2011, 7, 30)}
    shimao.age.should == 3
    Date.stub!(:today) { Date.new(2011, 7, 31)}
    shimao.age.should == 4
  end

# 上の記述は以下のようにも表現できます。
#   before do
#     @shimao = Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
#     @shimako = Person.new(name: "shimako", gender: :female, birthday: Date.new(2007, 8, 1))
#   end
#   context "shimao" do
#     subject{ @shimao }
#     its(:name){ should == "shimao"}
#     its(:gender) { should == :male }
#     its(:birthday) { should == Date.new(2007, 7, 31) }
#     it { subject.should be_male }
#     it { subject.should_not be_female }
#     context "誕生日前" do
#       before { Date.stub!(:today) { Date.new(2011, 7, 30) } }
#       its(:age) { should == 3 }
#     end
#     context "誕生日当日" do
#       before { Date.stub!(:today) { Date.new(2011, 7, 31) } }
#       its(:age) { should == 4 }
#     end
#   end

#   context "shimako" do
#     subject{ @shimako }
#     it { subject.should_not be_male }
#     it { subject.should be_female }
#   end
end
