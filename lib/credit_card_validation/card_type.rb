module CreditCardValidation
  class CardType
    attr_reader :card_number
    private :card_number

    def initialize(card_number)
      @card_number = card_number
    end

    def self.validate(card_number)
      new(card_number).validate
    end

    def validate
      if amex?
        'AMEX'
      elsif discover?
        'Discover'
      elsif master_card?
        'MasterCard'
      elsif visa?
        'Visa'
      else
        'Unknown'
      end
    end

    private

    def amex?
      number_starts_with?(prefixes[:amex]) && number_is_size?(15)
    end

    def discover?
      number_starts_with?(prefixes[:discover]) && number_is_size?(16)
    end

    def master_card?
      number_starts_with?(prefixes[:master_card]) && number_is_size?(16)
    end

    def visa?
      number_starts_with?(prefixes[:visa]) && (number_is_size?(13) || number_is_size?(16))
    end

    def number_starts_with?(prefixes)
      prefixes.inject(false) do |acc, prefix|
        card_number.start_with?(prefix) || acc
      end
    end

    def number_is_size?(size)
      card_number.length == size
    end

    def prefixes
      {
        amex: ['34', '36'],
        discover: ['6011'],
        master_card: [*'51'..'55'],
        visa: ['4'],
      }
    end
  end
end
