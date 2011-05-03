# -*- encoding: utf-8 -*-
class Person
  attr_accessor :name, :gender, :birthday

  def initialize(options)
    @name = options.delete(:name)
    @gender = options.delete(:gender)
    @birthday = options.delete(:birthday)
  end

  def male?
    @gender == :male
  end

  def female?
    @gender == :female
  end

  def age
    # http://itpro.nikkeibp.co.jp/article/Watcher/20070822/280097/
    (Date.today.strftime("%Y%m%d").to_i - @birthday.strftime("%Y%m%d").to_i) / 10000
  end

  def say
    # リファクタリング前なので冗長な記述
    now = Time.now
    result = nil
    if 4 <= now.hour and now.hour < 12
      result = "Good morning!"
    end
    if 12 <= now.hour and now.hour < 18
      result = "Good afternoon!"
    end
    if 18 <= now.hour and now.hour < 22
      result = "Good evening!"
    end
    if (22 <= now.hour and now.hour < 24) or
        (0 <= now.hour and now.hour < 4)
      result = "Good night!"
    end
    result

    # リファクタリング例としてはこんなカンジ
#     now = Time.now
#     case now.hour
#     when 4..11
#       "Good morning!"
#     when 12..17
#       "Good afternoon!"
#     when 18..21
#       "Good evening!"
#     else
#       "Good night!"
#     end
  end
end
