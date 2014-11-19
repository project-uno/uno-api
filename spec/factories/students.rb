FactoryGirl.define do
  factory :student do
    user { create(:user) } 
  end

end
