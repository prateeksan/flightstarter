# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:model) { User.new password: 'a' }

  describe '#has_stripe_connect?' do
    subject { model.has_stripe_connect? }

    context 'no stripe info' do
      it { is_expected.to be false }
    end

    context 'with stripe info' do
      before do
        model.stripe_uid = '12345'
        model.stripe_pk = '67890'
        model.stripe_token = 'abcde'
      end

      it { is_expected.to be true }

      context 'except uid' do
        before { model.stripe_uid = nil }
        it { is_expected.to be false }
      end

      context 'except pk' do
        before { model.stripe_pk = nil }
        it { is_expected.to be false }
      end

      context 'except token' do
        before { model.stripe_token = nil }
        it { is_expected.to be false }
      end
    end
  end

  describe '#add_stripe_connect' do
    let(:minimal_hash) do
      { "uid" => "12345",
        "info" => {
          "stripe_publishable_key" => "abcde",
        },
        "credentials" => {
          "token" => "fghij",
        }
      }
    end

    subject { model.add_stripe_connect(OmniAuth::AuthHash.new(raw_hash)) }

    context 'minimal params' do
      let(:raw_hash) { minimal_hash }

      it 'changes has_stripe_connect? from false to true' do
        expect { subject }.to change { model.has_stripe_connect? }.
          from(false).to(true)
      end

      it 'model is valid' do
        subject
        expect(model).to be_valid
      end
    end

    context 'missing credentials' do
      let(:raw_hash) { minimal_hash.except 'credentials' }

      it 'does not change has_stripe_connect?' do
        expect { subject }.not_to change { model.has_stripe_connect? }
      end

      it 'model is invalid' do
        subject
        expect(model).not_to be_valid
      end

      context 'model already has token' do
        before do
          model.stripe_token = 'abcdef'
        end

        it 'model is invalid' do
          subject
          expect(model).not_to be_valid
        end
      end
    end
  end

  describe 'validations' do
    subject { model }

    describe 'stripe info' do
      context 'all nil' do
        it { is_expected.to be_valid }
      end

      context 'all present' do
        before do
          model.stripe_uid = '12'
          model.stripe_pk = '34'
          model.stripe_token = '56'
        end

        it { is_expected.to be_valid }

        context 'except uid' do
          before { model.stripe_uid = nil }
          it { is_expected.not_to be_valid }
        end

        context 'except pk' do
          before { model.stripe_pk = nil }
          it { is_expected.not_to be_valid }
        end

        context 'except token' do
          before { model.stripe_token = nil }
          it { is_expected.not_to be_valid }
        end
      end
    end
  end
end
