module CreditCardValidation
  class CardNumber
    attr_reader :card_number
    private :card_number

    def initialize(card_number)
      @card_number = card_number
    end

    def self.validate(card_number)
      new(card_number).validate
    end

    def validate
      if sum_digits % 10 == 0
        'Valid'
      else
        'Invalid'
      end
    end

    private

    def sum_digits
      twice_odd_digits.inject(:+) + even_digits.inject(:+)
    end

    def twice_odd_digits
      unflattened_twice_odd_digits.
        map(&:to_s).
        flat_map(&:chars).
        map(&:to_i)
    end

    def unflattened_twice_odd_digits
      all_digits.select.with_index { |_,i| i.odd? }.map { |n| n*2 }
    end

    def even_digits
      all_digits.select.with_index { |_,i| i.even? }
    end

    def all_digits
      card_number.chars.reverse.map(&:to_i)
    end
  end
end
