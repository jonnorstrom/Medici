class AddAttachmentPhotoToExhibits < ActiveRecord::Migration
  def self.up
    change_table :exhibits do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :exhibits, :photo
  end
end
