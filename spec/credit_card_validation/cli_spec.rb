require 'spec_helper'

module CreditCardValidation
  RSpec.describe CLI do
    describe '.run' do
      subject { CLI.run(card_number) }

      let(:card_number) { '4408041234567893' }
      let(:card_type_validation) { 'Visa' }
      let(:card_number_validation) { 'Valid' }

      let(:validation_information) {
        "Card type is: #{card_type_validation}.\n"\
        "Card number is: #{card_number_validation}.\n"
      }

      before do
        allow(CardNumber).to receive(:validate).with(card_number).
          and_return(card_number_validation)
        allow(CardType).to receive(:validate).with(card_number).
          and_return(card_type_validation)
      end

      it { is_expected.to eql(validation_information) }

      it 'runs the validation for a card number' do
        subject
        expect(CardNumber).to have_received(:validate).with(card_number)
      end

      it 'runs the validation for a card type' do
        subject
        expect(CardType).to have_received(:validate).with(card_number)
      end

      context 'when the number is formatted with spaces or hyphens' do
        subject { CLI.run(formatted_card_number) }

        let(:formatted_card_number) { '4408 0412 34-56 78-93' }

        it { is_expected.to eql(validation_information) }
      end
    end
  end
end
