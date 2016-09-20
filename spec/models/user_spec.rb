describe User, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer).with_options(default: '0') }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:inet) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:inet) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { expect(create(:user)).to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'Relations' do
    it { is_expected.to have_many(:devices) }
  end
end
