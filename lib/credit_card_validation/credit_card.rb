module CreditCardValidation
  class CreditCard
    attr_reader :card_number
    private :card_number

    def initialize(card_number)
      @card_number = card_number
    end

    def number_starts_with?(prefixes)
      prefixes.inject(false) do |acc, prefix|
        card_number.start_with?(prefix) || acc
      end
    end

    def number_is_length?(size)
      card_number.length == size
    end

    def odd_digits
      all_digits.select.with_index { |_,i| i.odd? }
    end

    def even_digits
      all_digits.select.with_index { |_,i| i.even? }
    end

    private

    def all_digits
      card_number.chars.reverse.map(&:to_i)
    end
  end
end
