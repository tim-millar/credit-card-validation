module CreditCardValidation
  class CardNumber
    extend Forwardable

    def_delegators :@credit_card, :odd_digits, :even_digits

    def initialize(credit_card)
      @credit_card = credit_card
    end

    def self.validate(credit_card)
      new(credit_card).validate
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
      odd_digits.map { |n| n*2 }
    end
  end
end
