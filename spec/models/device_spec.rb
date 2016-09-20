describe Device, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:bt_mac_address).of_type(:string) }
    it { is_expected.to have_db_column(:category_id).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:power).of_type(:float) }
    it { is_expected.to have_db_column(:validity).of_type(:boolean) }
    it { is_expected.to have_db_column(:validity).of_type(:boolean) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:active).of_type(:boolean).with_options(null: false, default: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:bt_mac_address) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:power) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
  end
end
