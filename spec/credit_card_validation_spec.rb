require 'spec_helper'

RSpec.describe CreditCardValidation do
  it 'has a version number' do
    expect(CreditCardValidation::VERSION).not_to be nil
  end
end
