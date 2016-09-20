ActiveAdmin.register Device do
  permit_params :user_id, :bt_mac_address, :name, :power, :validity, :active, :category_id, time_gap_ids: []

  index do
    selectable_column
    id_column
    column 'User name' do |d|
      User.find(d.user_id).name
    end
    # column 'User email' do |d|
    #   User.find(d.user_id).email
    # end
    column :bt_mac_address
    column :category
    column :name
    column :power
    column :time_gap_ids
    column :validity
    column :active
    # column :created_at
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

  show do
    attributes_table do
      row :bt_mac_address
      row :category
      row :name
      row :power
      row :time_gap_ids
      row :validity
      row :active
      row 'TimeGaps' do
        device.time_gaps.pluck(:start, :end).join('<br/>').html_safe
      end
    end
  end

  form do |f|
    f.inputs 'Device Details' do
      f.input :bt_mac_address
      f.input :category, as: :select2, collection: Category.all.map { |u| [u.name, u.id] }
      f.input :name
      f.input :power
      f.input :validity, as: :select
      f.input :active, as: :select
      f.input :user, as: :select2, collection: User.all.map { |u| ["#{u.name} (#{u.email})", u.id] }
      f.input :time_gaps, as: :select2_multiple, collection: TimeGap.all.map { |u| ["#{u.start.strftime('%H:%M')} - #{u.end.strftime('%H:%M')}", u.id] }
    end
    f.actions
  end
end
