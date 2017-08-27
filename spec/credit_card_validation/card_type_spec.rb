require 'spec_helper'

module CreditCardValidation
  RSpec.describe CardType do
    describe '.validate' do
      subject { CardType.validate(card_number) }

      let(:card_number) { '4408041234567893' }
      let(:card_type) { 'Visa' }

      it 'validates the card type' do
        expect(subject).to eql(card_type)
      end

      context 'when the card type cannot be recognised' do
        let(:card_number) { '123456 abcdef' }

        it 'returns unknown' do
          expect(subject).to eql('Unknown')
        end
      end
    end
  end
end
