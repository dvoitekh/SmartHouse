describe 'Guest' do
  subject { Ability.new(user) }
  let(:user) { User.new }
  let!(:client) { create :user, role: 'client' }
  let!(:device) { create :device, user: client }

  it { is_expected.to not_have_abilities(:create, :read, :update, :destroy).on(client) }
  it { is_expected.to not_have_abilities(:create, :read, :update, :destroy).on(device) }
end

describe 'Customer' do
  subject { Ability.new(user) }
  let!(:user) { create :user, role: 'client' }
  let!(:another_user) { create :user, role: 'client' }
  let!(:device) { create :device, user: user }
  let!(:another_device) { create :device, user: another_user }

  it { is_expected.to have_abilities(:read, :update).on(user) }
  it { is_expected.to not_have_abilities(:read, :destroy).on(another_user) }

  it { is_expected.to have_abilities(:create, :read, :update, :destroy).on(device) }
  it { is_expected.to not_have_abilities(:create, :read, :update, :destroy).on(another_device) }
end

describe 'Admin' do
  subject { Ability.new(user) }
  let!(:user) { create :user, role: 'admin' }
  let!(:client) { create :user, role: 'client' }
  let!(:device) { create :device, user: client }

  it { is_expected.to have_abilities(:create, :read, :update, :destroy).on(user) }
  it { is_expected.to have_abilities(:create, :read, :update, :destroy).on(client) }
  it { is_expected.to have_abilities(:create, :read, :update, :destroy).on(device) }
end
