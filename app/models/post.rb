class Post < ApplicationRecord
    validates :title, :content, :summary, :category, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait
    
    # custom validation
    def is_clickbait
        if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")

            errors.add(:title, "Title isn't clickbaity enough.")
        end
    end


end
