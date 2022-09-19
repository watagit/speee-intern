require 'rails_helper'

RSpec.describe ReviewsHelper, type: :helper do
  describe '#format_price' do
    it '10,000を渡すと1万円が返る' do
      expect(helper.format_price(10_000)).to eq '1万円'
    end

    it '10,000,000を渡すと1,000万円が返る' do
      expect(helper.format_price(10_000_000)).to eq '1,000万円'
    end
  end

  describe '#format_date' do
    it '2022-01-01を渡すと2022年1月が返る' do
      date = Time.zone.parse('2022-01-01')
      expect(helper.format_date(date)).to eq '2022年1月'
    end

    it '2022-11-11を渡すと2022年11月が返る' do
      date = Time.zone.parse('2022-11-11')
      expect(helper.format_date(date)).to eq '2022年11月'
    end
  end
end
