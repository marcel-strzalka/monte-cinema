# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HallsController do
  let(:customer) { create(:user) }
  let(:manager) { create(:user, :manager) }

  shared_examples 'unauthorized user' do
    it 'redirects to the root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'adds flash message' do
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe '#index' do
    subject(:request) { get('/halls') }

    it 'returns http status ok' do
      request
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    subject(:request) { get("/halls/#{id}") }

    let(:hall) { create(:hall) }
    let(:id) { hall.id }

    it 'returns http status ok' do
      request
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    subject(:request) { get('/halls/new') }

    context 'when user is a customer' do
      before do
        sign_in(customer)
        request
      end

      include_examples 'unauthorized user'
    end

    context 'when user is a manager' do
      it 'returns http status ok' do
        sign_in(manager)
        request
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#create' do
    subject(:request) { post('/halls', params:) }

    let(:params) { { hall: { name: 'T', capacity: 1 } } }

    context 'when user is a customer' do
      before do
        sign_in(customer)
        request
      end

      include_examples 'unauthorized user'
    end

    context 'when user is a manager' do
      before { sign_in(manager) }

      it 'creates a new hall' do
        expect { request }.to change(Hall, :count).by(1)
      end

      it 'redirects to the created hall' do
        request
        expect(response).to redirect_to(hall_path(Hall.last))
      end
    end
  end

  describe '#edit' do
    subject(:request) { get("/halls/#{id}/edit") }

    let(:hall) { create(:hall) }
    let(:id) { hall.id }

    context 'when user is a customer' do
      before do
        sign_in(customer)
        request
      end

      include_examples 'unauthorized user'
    end

    context 'when user is a manager' do
      it 'returns http status ok' do
        sign_in(manager)
        request
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#update' do
    subject(:request) { put("/halls/#{id}", params:) }

    let!(:hall) { create(:hall) }
    let(:id) { hall.id }

    let(:params) { { hall: { name: 'T', capacity: 1 } } }

    context 'when user is a customer' do
      before do
        sign_in(customer)
        request
      end

      include_examples 'unauthorized user'
    end

    context 'when user is a manager' do
      before { sign_in(manager) }

      it 'updates an already existing hall' do
        expect { request }
          .to change { hall.reload.name }.to(params[:hall][:name])
          .and change { hall.reload.capacity }.to(params[:hall][:capacity])
      end

      it 'redirects to the updated hall' do
        request
        expect(response).to redirect_to(hall_path(id))
      end
    end
  end

  describe '#destroy' do
    subject(:request) { delete("/halls/#{id}") }

    let!(:hall) { create(:hall) }
    let(:id) { hall.id }

    context 'when user is a customer' do
      before do
        sign_in(customer)
        request
      end

      include_examples 'unauthorized user'
    end

    context 'when user is a manager' do
      before { sign_in(manager) }

      it 'deletes a hall' do
        expect { request }.to change(Hall, :count).by(-1)
      end

      it 'redirects to the halls list' do
        request
        expect(response).to redirect_to(halls_path)
      end
    end
  end
end
