# frozen_string_literal: true

# == Schema Information
#
# Table name: special_offers
#
#  id           :uuid             not null, primary key
#  name         :string           not null
#  start_date   :date             not null
#  end_date     :date             not null
#  description  :text
#  members_only :boolean          default(FALSE), not null
#  offer_type   :string           not null
#  offer_code   :string
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe SpecialOffer, type: :model do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:start_date).of_type(:date) }
  it { should have_db_column(:end_date).of_type(:date) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:members_only).of_type(:boolean) }
  it { should have_db_column(:offer_type).of_type(:string) }
  it { should have_db_column(:offer_code).of_type(:string) }
  it { should have_db_index([:lounge_id]) }
end
