class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show]

  def index
    @menu_items = MenuItem.page(params[:page]).per(12)
  end

  def show
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
