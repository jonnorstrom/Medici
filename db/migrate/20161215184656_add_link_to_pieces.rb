class AddLinkToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column(:pieces, :external_url, :string)
  end
end
