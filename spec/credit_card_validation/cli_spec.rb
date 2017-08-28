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
        "Card number is: #{card_number_validation}."
      }

      before do
        allow(CardNumber).to receive(:validate).with(card_number).
          and_return(card_number_validation)
        allow(CardType).to receive(:validate).with(card_number).
          and_return(card_type_validation)
      end

      it 'runs the validation for a card number' do
        subject
        expect(CardNumber).to have_received(:validate).with(card_number)
      end

      it 'runs the validation for a card type' do
        subject
        expect(CardType).to have_received(:validate).with(card_number)
      end

      it 'displays validation information' do
        expect(subject).to eql(validation_information)
      end
    end
  end
end
