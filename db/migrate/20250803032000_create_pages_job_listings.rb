class CreatePagesJobListings < ActiveRecord::Migration[8.0]
  def change
    create_table :pages_job_listings do |t|
      t.string :title
      t.string :salary
      t.string :company
      t.string :location
      t.string :tags
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
