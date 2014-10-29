require 'rails_helper'

RSpec.describe Teacher, type: :model do

  let(:teacher) { Teacher.new }
  
  it { expect(teacher).to have_many(:courses) }

 
end
