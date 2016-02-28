class WelcomeController < ApplicationController

  def index
    @card = Card.card_for_review.first
  end

  def check_translation
    card = Card.find(params[:welcome][:id])
    correct_translation_message = "Правильный перевод! Переведите следующую карточку"
    wrong_translation_message = "Перевод неверен! Потренируйтесь еще."
    if card.check_translation(params[:welcome][:user_translation_text])
      card.set_review_date
      card.save!
      flash[:message] = correct_translation_message
    else
      flash[:message] = wrong_translation_message
    end

    redirect_to root_path #:back
  end

end
