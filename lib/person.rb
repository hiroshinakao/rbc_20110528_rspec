# -*- coding: utf-8 -*-
require 'date'
class Person

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
  end

end
