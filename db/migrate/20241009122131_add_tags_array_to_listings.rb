class AddTagsArrayToListings < ActiveRecord::Migration[7.2]
  def change
    change_table :listings do |t|
      t.string :tags, array: true
    end
  end
end
