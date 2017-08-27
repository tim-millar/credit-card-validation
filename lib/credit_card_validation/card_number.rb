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
      odd_digits.inject(:+) + even_digits.inject(:+)
    end

    def odd_digits
      raw_digits.select.with_index { |_,i| i.odd? }.
        map { |x| x*2 }.map(&:to_s).
        flat_map { |s| s.split('') }.
        map(&:to_i)
    end

    def even_digits
      raw_digits.select.with_index { |_,i| i.even? }
    end

    def raw_digits
      card_number.split('').reverse.map(&:to_i)
    end
  end
end
