module Bukanin
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for elem in self
          yield(elem)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each do |elem|
          result.append(yield(elem))
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each do |elem|
          result.append(elem) if elem
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce

      end
    end
  end
end
