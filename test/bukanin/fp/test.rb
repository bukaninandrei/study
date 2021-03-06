require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Bukanin::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Bukanin::Fp.rating(array)
    assert result == 6.809410385259628
  end

  # Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
  def test_chars_count
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Bukanin::Fp.chars_count(array, 5)
    assert result == 3966

    result = Bukanin::Fp.chars_count(array, 8.5)
    assert result == 42
  end
end
