require 'spec_helper'

module CreditCardValidation
  RSpec.describe CardNumber do
    describe '.validate' do
      subject { CardNumber.validate(card_number) }

      let(:card_number) { '4408041234567893' }

      it { is_expected.to eql('Valid') }

      context 'when the card number is invalid' do
        let(:card_number) { '4417123456789112' }

        it { is_expected.to eql('Invalid') }
      end
    end
  end
end
