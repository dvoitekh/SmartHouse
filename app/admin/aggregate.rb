ActiveAdmin.register Aggregate do
   permit_params :date, :device_id, :energy

   index do
     selectable_column
     id_column
     column :device_id
     column :date
     column :energy
     actions
   end

   filter :device_id
   filter :date
   filter :energy
   filter :created_at

   form do |f|
     f.inputs 'Category Details' do
       f.input :device, as: :select2, collection: Device.all.map { |u| ["#{u.name} (#{u.bt_mac_address})", u.id] }
       f.input :date
       f.input :energy
     end
     f.actions
   end

 end
