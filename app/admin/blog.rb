ActiveAdmin.register Blog do
  permit_params :title, :body, :user_id, :image
  
  index do
    column :title
    column :body do |body|
      truncate(body.body, omision: "...", length: 100)
    end
    column "User" do |u|
      user = User.find(u.user_id)
      link_to user.name, admin_user_path(u.user_id)
    end 
    column :image
    default_actions
  end

end
