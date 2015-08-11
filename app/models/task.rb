class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true
  validate :start_date_cannot_be_in_the_past, :due_date_cannot_be_in_the_past

  def self.default
    where(["start_date <= ? and complete = ?", Date.today, false])
  end

  def self.completed
    where(complete: true)
  end

  def self.future
    where("start_date > ?", Date.today)
  end

  private
 
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
 
  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
