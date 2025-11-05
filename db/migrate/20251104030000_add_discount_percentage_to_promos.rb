class AddDiscountPercentageToPromos < ActiveRecord::Migration[7.1]
  def change
    add_column :promos, :discount_percentage, :integer
  end
end
