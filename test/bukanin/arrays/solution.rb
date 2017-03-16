module Bukanin
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |item| item > 0 ? max : item }
      end

      def search(array, query)
        r = search_bin(array, 0, array.size, query)
        array[r] == query ? r : -1
      end

      def search_bin(array, left, right, query)
        return right if left >= right

        mid = left + (right - left) / 2
        query <= array[mid] ? right = mid : left = mid + 1

        search_bin(array, left, right, query)
      end
    end
  end
end
