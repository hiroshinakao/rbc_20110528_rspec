# -*- encoding: utf-8 -*-
class Person
  attr_accessor :name, :gender, :birthday

  def initialize(options)
    @name = options.delete(:name)
    @gender = options.delete(:gender)
    @birthday = options.delete(:birthday)
  end
end
