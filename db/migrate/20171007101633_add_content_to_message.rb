class AddContentToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :content, :text
  end
end
