# -*- coding: utf-8 -*-
require 'rspec'
require 'date'
require File.expand_path('../lib/person', File.dirname(__FILE__))

describe "Person" do
  #
  # RSpec その 1
  #
  # 作成済みのspecを元に Personクラスの中身を実装しよう
  # RSpec の実行は以下のコマンドで実行できます
  #
  # rspec spec/person_spec.rb -fs -c
  #
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

  # 上の実装がクリアできたらチャレンジ
  it "Person#age で年齢を取得できるべき" do
    # pending を記述しているとテストを実行しません
    # 下の1行を削除することでテストを実行します
    pending "余裕があれば実装にチャレンジ"
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


  #
  # RSpec その 2
  #
  # 仕様から Spec を書いて実装してみよう
  #
  # 実装するのはnameの先頭のみを大文字にして返すPerson#capitalized_nameメソッド
  # 例) shimao, SHIMAO => Shimao
  describe :capitalized_name do
    # この中に仕様を書いていきます
  end

  # リファクタリングをしてみよう
  # person.rb に Person#say は実装していますが、コードが冗長です
  # テスト結果が変わらないように Person#say の実装方法をへんこうしてみよう
  describe :say do
    before do
      @shimao = Person.new(name: "shimao", gender: :male, birthday: Date.new(2007, 7, 31))
    end
    it "時刻に合わせて挨拶の文言が変わるべき" do
      Time.stub!(:now) { Time.mktime(2011, 1, 1, 9, 0) } # 9:00
      @shimao.say.should == "Good morning!"
      Time.stub!(:now) { Time.mktime(2011, 1, 1, 13, 0) } # 13:00
      @shimao.say.should == "Good afternoon!"
      Time.stub!(:now) { Time.mktime(2011, 1, 1, 18, 0) } # 18:00
      @shimao.say.should == "Good evening!"
      Time.stub!(:now) { Time.mktime(2011, 1, 1, 22, 0) } # 22:00
      @shimao.say.should == "Good night!"
    end
  end
end
