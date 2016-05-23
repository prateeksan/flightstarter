class DecimalCurrency < ActiveRecord::Migration
  TARGETS = [[:campaigns, :requisite_funding],
             [:pledges, :amount]]
  def up
    TARGETS.each do |table, column|
      change_column table, column, :decimal, precision: 15, scale: 3
    end
  end

  def down
    TARGETS.each do |table, column|
      change_column table, column, :float
    end
  end
end
