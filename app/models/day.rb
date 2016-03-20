class Day < ActiveRecord::Base
  include DaysHelper
  
  belongs_to :user
  
  validates :date, presence: true
  validates :weight, numericality: { less_than: 1000}
  validates :user_id, presence: true
  validate :parse_date
  validate :is_valid_date
  
  
  
  private
  
  def is_valid_date
    unless date.is_a?(Date)
      self.errors.add(:date, "Not a valid date")
    end
  end
  
  def parse_date
     parse_helper(self) 
  end
  
  
 
end
