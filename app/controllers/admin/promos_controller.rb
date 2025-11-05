class Admin::PromosController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_promo, only: [:show, :edit, :update, :destroy]

  def index
    @promos = Promo.all.order(start_date: :desc)
  end

  def show
  end

  def new
    @promo = Promo.new
  end

  def create
    @promo = Promo.new(promo_params)
    
    if @promo.save
      redirect_to admin_promos_path, notice: 'Promo was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @promo.update(promo_params)
      redirect_to admin_promos_path, notice: 'Promo was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @promo.destroy
    redirect_to admin_promos_path, notice: 'Promo was successfully deleted.'
  end

  private

  def set_promo
    @promo = Promo.find(params[:id])
  end

  def promo_params
    params.require(:promo).permit(:title, :description, :start_date, :end_date, :discount_percentage)
  end
end
