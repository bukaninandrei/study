module Bukanin
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |item| item > 0 ? max : item }
      end

      def search(array, query)
        right = array.size
        left = 0

        loop do
          break if left >= right
          mid = left + (right - left) / 2
          if query <= array[mid]
            right = mid
          else
            left = mid + 1
          end
        end

        (array[right] == query) ? right : -1
      end
    end
  end
end
