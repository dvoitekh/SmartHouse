ActiveAdmin.register Device do
   permit_params :user_id, :bt_mac_address, :category, :name, :power, :validity, :active

   index do
     selectable_column
     id_column
     column 'User name' do |d|
        User.find(d.user_id).name
     end
     column 'User email' do |d|
        User.find(d.user_id).email
     end
     column :bt_mac_address
     column :category
     column :name
     column :power
     column :validity
     column :active
     column :created_at
     actions
   end

   filter :bt_mac_address
   filter :user
   filter :category
   filter :name
   filter :power
   filter :validity
   filter :active
   filter :created_at

   form do |f|
     f.inputs 'Device Details' do
       f.input :bt_mac_address
       f.input :category
       f.input :name
       f.input :power
       f.input :validity, as: :select
       f.input :active, as: :select
       f.input :user, as: :select2, collection: User.all.map { |u| ["#{u.name} (#{u.email})", u.id] }
     end
     f.actions
   end

 end
