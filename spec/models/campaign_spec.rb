# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:model) { build(:campaign) }
  subject { model }

  it { is_expected.to be_valid }

  context 'missing user' do
    before { model.user = nil }
    it { is_expected.not_to be_valid }
  end

  context 'missing title' do
    before { model.title = nil }
    it { is_expected.not_to be_valid }
  end

  context 'blank title' do
    before { model.title = '' }
    it { is_expected.not_to be_valid }
  end

  context 'title too short' do
    before { model.title = 'a' }
    it { is_expected.not_to be_valid }
  end

  context 'minimum-length title' do
    before { model.title = 'ab' }
    it { is_expected.to be_valid }
  end

  context 'title contains only digits' do
    before { model.title = '34' }
    it { is_expected.not_to be_valid }
  end
end
