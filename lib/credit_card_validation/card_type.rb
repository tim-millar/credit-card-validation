module CreditCardValidation
  class CardType
    attr_reader :card_number
    def initialize(card_number)
      @card_nmber = card_number
    end

    def self.validate(card_number)
      new(card_number).validate
    end

    def validate
      'Visa'
    end
  end
end
