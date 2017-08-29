require 'spec_helper'

module CreditCardValidation
  RSpec.describe CardNumber do
    describe '.validate' do
      subject { CardNumber.validate(credit_card) }

      let(:credit_card) {
        double(
          'CreditCard',
          odd_digits: odd_digits,
          even_digits: even_digits,
        )
      }

      let(:odd_digits) { [9, 7, 5, 3, 1, 0, 0, 4] }
      let(:even_digits) { [3, 8, 6, 4, 2, 4, 8, 4] }

      it { is_expected.to eql('Valid') }

      context 'when the card number is invalid' do
        let(:odd_digits) { [1, 9, 7, 5, 3, 1, 1, 4] }
        let(:even_digits) { [2, 1, 8, 6, 4, 2, 7, 4] }

        it { is_expected.to eql('Invalid') }
      end
    end
  end
end
