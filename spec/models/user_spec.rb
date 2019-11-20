# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    user = create(:user)
    expect(user).to be_valid
  end
  it 'is not valid without number' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
end