class Card < ActiveRecord::Base
  before_validation :set_review_date, on: :create
  validates :original_text, :translated_text, :review_date, presence: true
  validate :original_translated_text_not_similar

  # scope is using PostgreSQL RANDOM() function for choosing Card.
  # For other DB use ActiveRecord - offset(rand(...))
  # or specific function for that DB (i.e. RAND() for MySQL)

  scope :card_for_review, -> { where("review_date < ?", Time.now).order("RANDOM()") }

  def check_translation(user_translation_text)
    if (original_text.mb_chars.downcase.strip == user_translation_text.mb_chars.downcase.strip)
      update_column("review_date", 3.days.from_now)
      return true
    else
      return false
    end
  end

  protected

    def set_review_date
      self.review_date = 3.days.from_now
    end

	private
		def original_translated_text_not_similar
			if original_text.mb_chars.downcase.to_s == translated_text.mb_chars.downcase.to_s
				errors[:translated_text] << "Слова не должны совпадать!"
			end
		end

end