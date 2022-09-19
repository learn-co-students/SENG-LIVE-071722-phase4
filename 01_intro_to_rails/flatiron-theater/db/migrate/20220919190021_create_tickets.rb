class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.float :price

      t.timestamps
    end
  end
end
