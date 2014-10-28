require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { User.new }
  
  it { expect(user).to validate_presence_of :email }
  it { expect(user).to validate_uniqueness_of :email }

  it 'returns the full name' do
    user.first_name = "Jose"
    user.last_name = "Rizal"
    expect(user.full_name).to eq("Jose Rizal")
  end
end
