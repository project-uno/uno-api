FactoryGirl.define do
  factory :teacher do
    user { create(:user) } 
  end

end
