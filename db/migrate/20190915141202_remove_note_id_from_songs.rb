class RemoveNoteIdFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :note_id
  end
end
