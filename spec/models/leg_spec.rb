# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.describe Leg, type: :model do
  let(:leg) { build(:leg) }

  describe '#from_to' do
    subject { leg.from_to }

    context 'startpoint and endpoint' do
      before do
        leg.startpoint = build(:city, name: 'Albuquerque')
        leg.endpoint = build(:city, name: 'Denver')
      end

      it { is_expected.to eq('Albuquerque → Denver') }
    end

    context 'only startpoint' do
      before do
        leg.startpoint = build(:city, name: 'Atlanta')
        leg.endpoint = nil
      end

      it { is_expected.to eq('Atlanta') }
    end

    context 'only endpoint' do
      before do
        leg.startpoint = nil
        leg.endpoint = build(:city, name: 'Boston')
      end

      it { is_expected.to eq('→ Boston') }
    end

  end
end
