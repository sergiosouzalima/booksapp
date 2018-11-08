class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_at
      t.text :text

      t.timestamps
    end
  end
end
