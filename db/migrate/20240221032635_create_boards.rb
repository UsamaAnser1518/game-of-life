class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.jsonb :state

      t.timestamps
    end
  end
end
