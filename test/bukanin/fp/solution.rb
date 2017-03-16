module Bukanin
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        items = array.select { |elem| !elem['country'].nil? && elem['rating_kinopoisk'].to_f > 0 && elem['country'].count(',') > 0 }
        items.map { |elem| elem['rating_kinopoisk'].to_f }.reduce(:+) / items.size
      end

      def chars_count(films, threshold)
        films.map { |elem| elem['rating_kinopoisk'].to_f >= threshold ? elem['name'].scan(/и/i).length : 0 }.reduce(:+)
      end
    end
  end
end
