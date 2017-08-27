require 'spec_helper'

module CreditCardValidation
  RSpec.describe CardType do
    subject { CardType.validate(card_number) }

    let(:card_number) { '4408 0412 3456 7893' }
    let(:card_type) { 'Visa' }

    it 'validates the card type' do
      expect(subject).to eql(card_type)
    end
  end
end
