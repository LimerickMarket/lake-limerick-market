class PromosController < ApplicationController
  before_action :set_promo, only: [:show]

  def index
    @promos = Promo.active.page(params[:page]).per(8)
  end

  def show
  end

  private

  def set_promo
    @promo = Promo.find(params[:id])
  end
end
