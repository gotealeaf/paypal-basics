class AddRecurringColumnsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :recurring, :boolean
    add_column :courses, :period, :string
    add_column :courses, :cycles, :integer
  end
end
