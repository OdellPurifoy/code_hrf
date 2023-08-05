# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                :uuid             not null, primary key
#  name              :string           not null
#  event_type        :string           not null
#  event_url         :string
#  zoom_code         :string
#  rsvp_needed       :boolean          default(FALSE), not null
#  maximum_capacity  :integer
#  start_time        :time             not null
#  end_time          :time             not null
#  members_only      :boolean          default(FALSE), not null
#  is_virtual        :boolean
#  event_description :text             not null
#  event_date        :date             not null
#  lounge_id         :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Database columns' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:end_time).of_type(:time) }
    it { should have_db_column(:event_date).of_type(:date) }
    it { should have_db_column(:event_description).of_type(:text) }
    it { should have_db_column(:event_type).of_type(:string) }
    it { should have_db_column(:event_url).of_type(:string) }
    it { should have_db_column(:is_virtual).of_type(:boolean) }
    it { should have_db_column(:maximum_capacity).of_type(:integer) }
    it { should have_db_column(:members_only).of_type(:boolean) }
    it { should have_db_column(:rsvp_needed).of_type(:boolean) }
    it { should have_db_column(:start_time).of_type(:time) }
    it { should have_db_index([:lounge_id]) }
  end

  describe 'Conditional Validations' do
    let(:event) { FactoryBot.create(:event, is_virtual: true, event_url: '', lounge: lounge) }
    let(:lounge) { FactoryBot.create(:lounge) }

    it 'triggers a validation error' do
      expect do
        event
      end.to raise_error(ActiveRecord::RecordInvalid,
                         "Validation failed: Event url is not a valid URL, Event url can't be blank")
    end

    context "when event_type is 'Virtual and event_url is provided" do
      let(:event_2) { FactoryBot.create(:event, is_virtual: false, lounge: lounge) }
      let(:lounge) { FactoryBot.create(:lounge) }

      it 'does not trigger a validation error' do
        expect { event_2 }.to_not raise_error
      end
    end

    context 'when the url is provided but it is invalid' do
      let(:event_3) { FactoryBot.create(:event, is_virtual: true, event_url: 'test-event.com', lounge: lounge) }
      let(:lounge) { FactoryBot.create(:lounge) }

      it 'trigger an invalid url error' do
        expect { event_3 }.to raise_error
      end
    end

    context 'when the event is virtual but no event_url is present' do
      let(:event_3) { FactoryBot.create(:event, is_virtual: true, event_url: nil, lounge: lounge) }
      let(:lounge) { FactoryBot.create(:lounge) }

      it 'trigger an invalid url error' do
        expect { event_3 }.to raise_error
      end
    end
  end

  describe 'Event description length validation' do
    let(:event) { FactoryBot.create(:event, event_description: 'Come join us for our event!', lounge: lounge) }
    let(:lounge) { FactoryBot.create(:lounge) }

    it 'does not raise a length validation error' do
      expect { event }.to_not raise_error
    end

    context 'when the event_description is too long' do
      let(:event) { FactoryBot.create(:event, event_description: Faker::Lorem.paragraph_by_chars(number: 2001)) }

      it 'raises a length validation error' do
        expect { event }.to raise_error
      end
    end
  end
end
