class Photo < ActiveRecord::Base
  attr_accessible  :file
  is_uploadcare_file :file
  #validates :girl_id, presence: true

  belongs_to :girl
 # is_uploadcare_file :url 
end
