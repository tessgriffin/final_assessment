class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :title, presence: true
end
