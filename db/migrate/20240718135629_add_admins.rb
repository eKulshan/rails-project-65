class AddAdmins < ActiveRecord::Migration[7.1]
  def change
    User.find_by(email: "eikulshan@gmail.com").update(admin: true)
  end
end
