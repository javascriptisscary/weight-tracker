class Day < ActiveRecord::Base
  belongs_to :user
  
  validates :date, presence: true
  validates :weight, numericality: { less_than: 1000}
  validates :user_id, presence: true
  
  validate :is_valid_date
  
  private
  def is_valid_date
    unless date.is_a?(Date)
  self.errors.add(:date, "Is not a valid date")
    end
  end
  
 
  
end
