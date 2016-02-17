class Card < ActiveRecord::Base

	validates :original_text, :translated_text, :review_date, presence: true
	validate :original_translated_text_not_similar 
	after_validation :set_review_date, on: :create

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