class Show
  attr_reader :name,
              :creator,
              :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    #calculate total salary of characters
    total_salary = 0
    @characters.each do |character|
      total_salary += character.salary
    end
    total_salary
  end

  def highest_paid_actor
    highest = @characters[0].salary
    @characters.each do |character|
      if character.salary > highest
        highest = character
      end
    end
    highest.actor
  end

  
end
