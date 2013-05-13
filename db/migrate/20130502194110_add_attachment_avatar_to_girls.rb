class AddAttachmentAvatarToGirls < ActiveRecord::Migration
  def change
    add_attachment :girls, :avatar
  end
end