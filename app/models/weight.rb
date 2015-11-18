class Weight < ActiveRecord::Base
has_many :days
has_many :users, through: :days
end
