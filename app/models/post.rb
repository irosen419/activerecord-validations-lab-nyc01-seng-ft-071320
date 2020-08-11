class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: {maximum: 250}
    validates :content, length: {minimum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait


    def clickbait
        array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        array = array.select{|bait| self.title.include?(bait) if self.title}
        unless array.length > 0
            errors.add(:title, "Not clickbait-y enough!")
        end
    end
end
