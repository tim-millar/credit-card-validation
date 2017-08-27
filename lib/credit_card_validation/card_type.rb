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
      (card_number.start_with?('34') || card_number.start_with?('36')) && card_number.length == 15
    end

    def discover?
      card_number.start_with?('6011') && card_number.length == 16
    end

    def master_card?
      ('51'..'55').inject(false) { |acc, x| card_number.start_with?(x) } && card_number.length == 16
    end

    def visa?
      card_number.start_with?('4') && (card_number.length == 13 || card_number.length == 16)
    end
  end
end
