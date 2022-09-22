class Production < ApplicationRecord
    validates :title, presence: true, uniqueness:true, length:{in: 3...50}
    validates :budget, numericality: {greater_than: 0}
    validates :description, length:{in: 4...1000}

    validate :genre, :no_more_musicals

    def no_more_musicals
        if Production.where(ongoing:true, genre: 'Musical').length > 0 && self.genre == 'Musical'
            errors.add(:genre, "Sorry only 1 musical at a time")
        end 
    end 
end
