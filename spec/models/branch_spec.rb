# rubocop:disable Metrics/BlockLength
RSpec.describe 'BranchModel', type: :model do
  let(:branch) { FactoryBot.create(:branch) }
  let(:reviews) do
    [
      FactoryBot.create(:review, satisfaction_level: 4, branch:),
      FactoryBot.create(:review, satisfaction_level: 5, branch:),
      FactoryBot.create(:review, satisfaction_level: 5, branch:)
    ]
  end

  describe '#average_satisfaction_level' do
    context '少数第二位が5以上' do
      before do
        branch.reviews = reviews
        branch.save
      end

      it '切り上げ' do
        expect(branch.average_satisfaction_level).to eq 4.7
      end
    end

    context '小数第二位が4以下' do
      before do
        reviews[1].satisfaction_level = 4
        branch.reviews = reviews
        branch.save
      end

      it '切り捨て' do
        expect(branch.average_satisfaction_level).to eq 4.3
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
