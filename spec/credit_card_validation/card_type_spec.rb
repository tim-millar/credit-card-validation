require 'spec_helper'

module CreditCardValidation
  RSpec.describe CardType do
    describe '.validate' do
      subject { CardType.validate(card_number) }

      let(:card_number) { '4408041234567893' }

      it { is_expected.to eql('Visa') }

      context 'when the type is AMEX' do
        let(:card_number) { '340000000000009' }

        it { is_expected.to eql('AMEX') }
      end

      context 'when the type is Discover' do
        let(:card_number) { '6011000000001234' }

        it { is_expected.to eql('Discover') }
      end

      context 'when the type is MasterCard' do
        let(:card_number) { '5500000000009999' }

        it { is_expected.to eql('MasterCard') }
      end

      context 'when the card type cannot be recognised' do
        let(:card_number) { '123456890123456' }

        it { is_expected.to eql('Unknown') }
      end
    end
  end
end
