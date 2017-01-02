class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :new_validation

  def new_validation
    bait = ["Won't Believe", "Secret", "Top ", "Guess"]

    if self.title.nil?
       errors.add(:title, "no title")
      return false
    end

    bait.each do |word|
      if title.include?(word)
        return true
      end
    end

     errors.add(:title, "it's clickbait")
  end
end


# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
