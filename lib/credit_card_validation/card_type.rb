module CreditCardValidation
  class CardType
    extend Forwardable

    def_delegators :@credit_card, :number_starts_with?, :number_is_length?

    def initialize(credit_card)
      @credit_card = credit_card
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
      number_starts_with?(prefixes[:amex]) && number_is_length?(15)
    end

    def discover?
      number_starts_with?(prefixes[:discover]) && number_is_length?(16)
    end

    def master_card?
      number_starts_with?(prefixes[:master_card]) && number_is_length?(16)
    end

    def visa?
      number_starts_with?(prefixes[:visa]) && (number_is_length?(13) || number_is_length?(16))
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
