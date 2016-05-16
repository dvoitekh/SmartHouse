ActiveAdmin.register TimeGap do
   permit_params :start, :end

   index do
     selectable_column
     id_column
     column :start
     column :end
     actions
   end

   filter :start
   filter :end

   form do |f|
     f.inputs 'TimeGap Details' do
       f.input :start
       f.input :end
     end
     f.actions
   end

 end
