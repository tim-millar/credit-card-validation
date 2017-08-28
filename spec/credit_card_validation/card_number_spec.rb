require 'spec_helper'

module CreditCardValidation
  RSpec.describe CardNumber do
    describe '.validate' do
      subject { CardNumber.validate(card_number) }

      let(:card_number) { '4408041234567893' }

      it 'validates the card number' do
        expect(subject).to eql('Valid')
      end

      context 'when the card number is invalid' do
        let(:card_number) { '4417123456789112' }

        it 'rejects the card' do
          expect(subject).to eql('Invalid')
        end
      end
    end
  end
end
