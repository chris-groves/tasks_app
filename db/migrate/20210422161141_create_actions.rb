class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.text :description

      t.timestamps
    end
  end
end
