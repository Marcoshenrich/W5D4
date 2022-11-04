class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      #user who created
      #long URL && short URL
      t.references :user, null: false, foreign_key: true
      t.string :long_url, null: false
      t.string :short_url, null: false, index:{unique: true}
      # t.index :short_url, unique: true
      t.timestamps
    end
  end
end
