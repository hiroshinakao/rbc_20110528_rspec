# -*- encoding: utf-8 -*-
class Person
  attr_accessor :name, :gender, :birthday

  def initialize(options)
    @name = options.delete(:name)
    @gender = options.delete(:gender)
    @birthday = options.delete(:birthday)
  end

  def age
    # http://itpro.nikkeibp.co.jp/article/Watcher/20070822/280097/
    (Date.today.strftime("%Y%m%d").to_i - @birthday.strftime("%Y%m%d").to_i) / 10000
  end
end
