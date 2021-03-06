class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows.push(show)
  end

  def main_characters_over_500k(show)
    #salary grater than 500_000, upcase character
    high_paid_characters =
      show.characters.find_all do |character|
        character.salary > 500000
      end
    high_paid_characters
  end

  def main_characters_in_upcase(show)
    upcase_characters =
    show.characters.find_all do |character|
      character.name == character.name.upcase
    end
    upcase_characters
  end

  def main_characters
    main_characters = []
    @shows.each do |show|
      main_characters.push(main_characters_over_500k(show) & main_characters_in_upcase(show))
    end
    main_characters.flatten
  end

  def actors_by_show
    actors_by_show = {}
    @shows.each do |show|
      actors_by_show[show] = show.actors
    end
    actors_by_show
  end

  def network_actors
    network_actors = []
      @shows.each do |show|
        network_actors.push(show.actors)
      end
    network_actors.flatten
  end

  def shows_by_actor
    shows_by_actor = {}
    network_actors.each do |actor|
      shows_by_actor[actor] = actor_show_titles(actor)
    end
    shows_by_actor
  end

  def actor_show_titles(actor)
    actor_show_titles = []
    @actor = actor
    @shows.each do |show|
      show.characters.find_all do |character|
        @actor == character.actor
      end
      actor_show_titles.uniq
    end
  end
end
