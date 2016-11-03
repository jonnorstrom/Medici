class AddHoursToMuseum < ActiveRecord::Migration[5.0]
  def change
    add_column :museums, :sun_open, :time
    add_column :museums, :sun_close, :time
    add_column :museums, :mon_open, :time
    add_column :museums, :mon_close, :time
    add_column :museums, :tue_open, :time
    add_column :museums, :tue_close, :time
    add_column :museums, :wed_open, :time
    add_column :museums, :wed_close, :time
    add_column :museums, :thu_open, :time
    add_column :museums, :thu_close, :time
    add_column :museums, :fri_open, :time
    add_column :museums, :fri_close, :time
    add_column :museums, :sat_open, :time
    add_column :museums, :sat_close, :time
  end
end
