class WelcomeController < ApplicationController
  def index
    @card = Card.card_for_review
  end

  def check_translation
    card = Card.find(params[:welcome][:id])
    if card.check_translation(params[:welcome][:user_translation_text])
      flash[:message] = "Правильный перевод! Переведите следующую карточку"
      card.update_review_date
    else
      flash[:message] = "Перевод неверен! Потренируйтесь еще."
    end

    redirect_to :back
  end
end
