require 'rails_helper'

RSpec.describe Period, :type => :model do
  
  let(:period) { Period.new }

  it { expect(period).to belong_to(:section) }
  it { expect(period).to belong_to(:subject) }

end
