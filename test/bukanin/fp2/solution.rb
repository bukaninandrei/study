module Bukanin
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for elem in self
          block_given? ? yield(elem) : elem
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each do |elem|
          result << yield(elem)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each.each { |elem| result << elem if elem }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(memo = nil)
        if memo.nil?
          shift = 1
          memo = self[0]
        else
          shift = 0
        end

        drop(shift).my_each { |e| memo = yield(memo, e) }
        memo
      end
    end
  end
end
