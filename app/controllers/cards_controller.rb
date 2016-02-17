class CardsController < ApplicationController
  before_action :card_init, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.create(card_params)
		
    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end

  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

    def card_init
      @card = Card.find(params[:id])			
    end

    def card_params
      params.require(:card).permit(:id, :original_text, :translated_text, :review_date)
    end

end
