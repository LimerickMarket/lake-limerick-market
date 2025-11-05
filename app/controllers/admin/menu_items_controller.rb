class Admin::MenuItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    
    if @menu_item.save
      redirect_to admin_menu_items_path, notice: 'Menu item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to admin_menu_items_path, notice: 'Menu item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to admin_menu_items_path, notice: 'Menu item was successfully deleted.'
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :category, :available, :image, :image_url)
  end
end
