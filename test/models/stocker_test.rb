# == Schema Information
#
# Table name: stockers
#
#  id                   :bigint           not null, primary key
#  avg_length           :decimal(, )
#  county               :string
#  date_stocked         :date
#  interpreted_address  :string
#  lonlat               :geometry         point, 0
#  quantity             :integer
#  species              :string
#  state                :string
#  verification_problem :integer
#  verification_status  :integer          default("unverified")
#  water_name           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_stockers_on_lonlat  (lonlat) USING gist
#
require "test_helper"

class StockerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
