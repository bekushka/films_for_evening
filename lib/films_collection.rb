require_relative 'film'

class FilmsCollection
  def initialize(films)
    @films = films
  end

  def director_list
    @director_list = director_all.sample(20)
    @director_list.map.with_index(1) { |director, index| "#{index} #{director}" }
  end

  def evening_film(user_choice)
    @films.select { |film| film.director == @director_list[user_choice - 1] }.sample
  end

  private

  def director_all
    @films.map(&:director).uniq.sort
  end
end
