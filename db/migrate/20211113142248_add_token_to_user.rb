class AddTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :graph_token, :string
    add_column :users, :graph_sent_at, :datetime
  end
end
