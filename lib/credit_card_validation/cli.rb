module CreditCardValidation
  class CLI
    attr_reader :card_number
    private :card_number

    def initialize(card_number)
      @card_number = card_number
    end

    def self.run(card_number)
      new(card_number).run
    end

    def run
      "Card type is: #{card_type_validation}.\n"\
      "Card number is: #{card_number_validation}.\n"
    end

    private

    def card_type_validation
      CardType.validate(parsed_card_number)
    end

    def card_number_validation
      CardNumber.validate(parsed_card_number)
    end

    def parsed_card_number
      card_number.gsub(/[^0-9]/, '')
    end
  end
end
