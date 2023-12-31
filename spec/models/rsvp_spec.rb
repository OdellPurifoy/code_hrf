# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:number_of_guests).of_type(:integer) }
  it { should have_db_index([:event_id]) }

  describe 'Number of guests validation' do
    let(:rsvp) { FactoryBot.create(:rsvp, number_of_guests: 2) }

    it 'does not raise an error' do
      expect { described_class }.to_not raise_error
    end

    context 'when the number_of_guests is less than zero' do
      let(:rsvp) { FactoryBot.create(:rsvp, number_of_guests: -2) }

      it 'raises a validation error' do
        expect { rsvp }.to raise_error
      end
    end
  end
end
