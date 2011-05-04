# -*- encoding: utf-8 -*-
require 'rspec'
require 'date'
require File.expand_path('../lib/person', File.dirname(__FILE__))

describe "Person" do

  # その1
  # 作成済みのspecを元に Personクラスの中身を実装してもらう
  # Person#ageの実装は難しいかもしれないです
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


  # その2

  # 仕様を伝えてSpecを書いて実装してもらう
  # 実装するのはnameの先頭のみを大文字にして返すPerson#capitalized_nameメソッド
  # 例) shimao, SHIMAO => Shimao
  # specの例としては以下のような感じ
  describe :capitalized_name do
    it "nameの先頭のみを大文字にするべき" do
      shimao1 = Person.new(name: "shimao")
      shimao1.capitalized_name.should == "Shimao"
      shimao2 = Person.new(name: "SHIMAO")
      shimao2.capitalized_name.should == "Shimao"
    end
  end

  # ライブコーディング
  # genderはシンボルだけではなく文字列でもオッケーにする
  describe :gender= do
    it "genderを文字列でセットしてもシンボルに変換してセットすべき" do
      shimao = Person.new(name: "shimao", gender: "male")
      shimao.gender.should == :male
      shimao = Person.new(name: "shimao", gender: "Male")
      shimao.gender.should == :male
      shimao = Person.new(name: "shimao", gender: :Male)
      shimao.gender.should == :male
    end
  end

  # person.rbにPerson#sayを冗長な形式で記述済み
  # 参加者にはリファクタリングをしてもらい、テストコードの大切さを実感してもらう
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
