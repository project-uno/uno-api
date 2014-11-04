class Period < ActiveRecord::Base
  
  belongs_to :section
  belongs_to :subject
  

end
