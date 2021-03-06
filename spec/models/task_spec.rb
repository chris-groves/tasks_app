require "rails_helper"

RSpec.describe Task, type: :model do
  let(:task) { FactoryBot.create(:task) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_uniqueness_of(:description) }
  end

  describe "associations" do
     it { is_expected.to belong_to(:user) }
  end
end
