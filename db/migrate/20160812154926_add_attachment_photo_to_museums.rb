class AddAttachmentPhotoToMuseums < ActiveRecord::Migration
  def self.up
    change_table :museums do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :museums, :photo
  end
end
