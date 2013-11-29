ActiveAdmin.register Resource do
  permit_params :title, :description, :user_id
  index do
    column :title
    column :description do |description|
      truncate(description.description, omision: "...", length: 100)
    end
    column "User" do |u|
      user = User.find(u.user_id)
      link_to user.name, admin_user_path(u.user_id)
    end 

    default_actions
  end

end
