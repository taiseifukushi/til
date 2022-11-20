class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.references :movie
      t.string :key
      t.timestamps
    end
  end
end
