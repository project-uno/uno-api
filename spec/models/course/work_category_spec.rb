require 'rails_helper'

RSpec.describe Course::WorkCategory, :type => :model do

  let(:course_work_category) { Course::WorkCategory.new }

  it { expect(course_work_category).to validate_presence_of(:name) }
  it { expect(course_work_category).to validate_presence_of(:weight)}

end
