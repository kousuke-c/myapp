class Plan < ApplicationRecord
   validates :title, presence: true
      validates :startTime, presence: true ,numericality: true
      validates :endTime, presence: true,numericality: true
     

    
end
