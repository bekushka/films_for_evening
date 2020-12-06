require_relative 'lib/film'
require_relative 'lib/films_reader'
require_relative 'lib/films_collection'

films = FilmsReader.from_imdb250
films_collection = FilmsCollection.new(films)

puts 'Программа «Фильм на вечер».'
puts 'Фильм какого режисера из списка Вы хотели бы посмотреть?'

puts films_collection.director_list

puts 'Ваш ответ: '
user_choice = STDIN.gets.to_i

puts 'И сегодня вечером рекомендую посмотреть:'
puts films_collection.evening_film(user_choice)
