require 'rails_helper'

RSpec.describe Section, :type => :model do
  
  let(:section) { Section.new }

  it { expect(section).to have_many(:students) }
  it { expect(section).to have_many(:periods) }
  it { expect(section).to have_many(:subjects).through(:periods) }

end
