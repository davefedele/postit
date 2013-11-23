class Vote < ActiveRecord::Base
  belongs_to  :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to  :voteable, polymorphic: true
  has_many    :votes, as: :voteable
  
  validates_uniqueness_of :creator, scope: :voteable
end