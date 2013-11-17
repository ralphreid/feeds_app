class Tag < ActiveRecord::Base

  attr_accessible :archive, :bookmark

  validates_inclusion_of :archive, :in => [true, false]
  validates_inclusion_of :bookmark, :in => [true, false]

  belongs_to :user
  belongs_to :article

end
