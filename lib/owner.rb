require 'pry'
require_relative '/Users/JakobPersons/Development/Flatiron/Phase_1/week_1/ruby-oo-object-relationships-my-pets/lib/cat.rb'
require_relative '/Users/JakobPersons/Development/Flatiron/Phase_1/week_1/ruby-oo-object-relationships-my-pets/lib/dog.rb'


class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
      p "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    #binding.pry
    @@all.clear 
  end

  def cats
    Cat.all.select do |cat|
      if cat.owner == self
        cat.name
      end
    end
  end

  def dogs
    Dog.all.select do |dog|
      if dog.owner == self
        dog.name
      end
    end
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end


  def walk_dogs
    Dog.all.select do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end
  
  def feed_cats
    Cat.all.select do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end


  def sell_pets
     
    Dog.all.select do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end

    Cat.all.select do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

  end
      
  def list_pets
      p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  #binding.pry

end