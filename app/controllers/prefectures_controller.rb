class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])

    branch_ids = AvailableArea.where(city_id: @prefecture.cities.ids).pluck(:branch_id)

    # HACK: 店舗が増えると処理も重くなるため、ゆくゆくは定期実行->カラム更新などで対応したい
    @prefecture_branches = Branch.where(id: branch_ids).eager_load(:reviews, :company, city: [:prefecture]).sort do
      |a, b| b.average_satisfaction_level <=> a.average_satisfaction_level
    end
  end
end
