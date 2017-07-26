class AddWeatherToForecasts < ActiveRecord::Migration
  def change
    add_column :forecasts, :weather, :string
  end
end
