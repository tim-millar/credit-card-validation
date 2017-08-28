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

      context 'when the type is AMEX' do
        let(:card_number) { '340000000000009' }

        it 'validates the card type' do
          expect(subject).to eql('AMEX')
        end
      end

      context 'when the type is Discover' do
        let(:card_number) { '6011000000001234' }

        it 'validates the card type' do
          expect(subject).to eql('Discover')
        end
      end

      context 'when the type is MasterCard' do
        let(:card_number) { '5500000000009999' }

        it 'validates the card type' do
          expect(subject).to eql('MasterCard')
        end
      end

      context 'when the card type cannot be recognised' do
        let(:card_number) { '123456890123456' }

        it 'returns unknown' do
          expect(subject).to eql('Unknown')
        end
      end
    end
  end
end
