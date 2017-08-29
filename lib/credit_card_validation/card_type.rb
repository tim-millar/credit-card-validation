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
      card_starts_with?(prefixes[:amex]) && is_fifteen_digits?
    end

    def discover?
      card_starts_with?(prefixes[:discover]) && is_sixteen_digits?
    end

    def master_card?
      card_starts_with?(prefixes[:master_card]) && is_sixteen_digits?
    end

    def visa?
      card_starts_with?(prefixes[:visa]) && (is_thirteen_digits? || is_sixteen_digits?)
    end

    def card_starts_with?(prefixes)
      prefixes.inject(false) do |acc, prefix|
        card_number.start_with?(prefix) || acc
      end
    end

    def prefixes
      {
        amex: ['34', '36'],
        discover: ['6011'],
        master_card: [*'51'..'55'],
        visa: ['4'],
      }
    end

    def is_sixteen_digits?
      card_number.length == 16
    end

    def is_thirteen_digits?
      card_number.length == 13
    end

    def is_fifteen_digits?
      card_number.length == 15
    end
  end
end
