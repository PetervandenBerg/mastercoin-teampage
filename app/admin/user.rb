ActiveAdmin.register User do
  permit_params :email, :name, :description, :job_description, :kind, :linked_in, :password, :password_confirmation
  
  index do
    column :email
    column :name
    column :description do |description|
      truncate(description.description, omision: "...", length: 100)
    end
    column :job_description
    column :kind
    column :linked_in
    column :image

    default_actions
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :description
      f.input :job_description
      f.input :kind
      f.input :linked_in
    end
    f.actions
  end
  
end
