require 'spec_helper'

module CreditCardValidation
  RSpec.describe CreditCard do
    subject(:credit_card) { CreditCard.new(card_number) }

    let(:card_number) { '4408041234567893' }

    describe '#number_starts_with?' do
      it 'checks the start of the credit card number' do
        expect(credit_card.number_starts_with?(['43', '440'])).to eql(true) 
      end
    end

    describe '#number_is_length?' do
      it 'checks the length of the credit card number' do
        expect(credit_card.number_is_length?(16)).to eql(true)
      end
    end

    describe '#odd_digits' do
      let(:odd_digits) { [9, 7, 5, 3, 1, 0, 0, 4] }

      it 'returns the reversed odd digits from the credit card number' do
        expect(credit_card.odd_digits).to eql(odd_digits)
      end
    end

    describe '#even_digits' do
      let(:even_digits) { [3, 8, 6, 4, 2, 4, 8, 4] }

      it 'returns the reversed odd digits from the credit card number' do
        expect(credit_card.even_digits).to eql(even_digits)
      end
    end
  end
end
