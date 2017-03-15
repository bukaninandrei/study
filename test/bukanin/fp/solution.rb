module Bukanin
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sumstat = 0.0
        counted = 0

        for idx in 0..(array.size - 1)
          item = array[idx]

          next if item['country'].nil? || item['country'].split(',').count < 2

          if (rate = item['rating_kinopoisk'].to_f) > 0
            counted += 1
            sumstat += rate
          end
        end

        sumstat / counted
      end

      def chars_count(films, threshold)
        counted = 0

        for idx in 0..(films.size - 1)
          next if films[idx]['rating_kinopoisk'].to_f < threshold
          counted += films[idx]['name'].scan(/и/i).length
        end

        counted
      end
    end
  end
end
