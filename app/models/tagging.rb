class Tagging < ApplicationRecord
  belongs_to :tag, :inverse_of => :taggings, :required => false
  belongs_to :museum, :inverse_of => :taggings, :required => false
  belongs_to :exhibit, :inverse_of => :taggings, :required => false
  belongs_to :event, :inverse_of => :taggings, :required => false
  belongs_to :piece, :inverse_of => :taggings, :required => false
  belongs_to :user, :inverse_of => :taggings, :required => false

end
