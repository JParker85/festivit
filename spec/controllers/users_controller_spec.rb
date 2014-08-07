require 'rails_helper'

describe UsersController, :type => :controller do
  describe 'Routes correctly' do
    it 'to admin' do
      expect(:get => "/admins/new").to route_to(
      :action => "new",
      :controller => "users",
      :type => "Admin",
      )
    end

    it 'to volunteers' do
      expect(:get => "/volunteers/new").to route_to(
      :action => "new",
      :controller => "users",
      :type => "Volunteer",
      )
    end
  end

  describe 'POST admin' do
    def create_admin
      post :create, admin: FactoryGirl.attributes_for(:user), type: "Admin"
    end

    it 'creates an admin' do
      expect{ create_admin }.to change { Admin.count }.by(1)
    end
  end

  describe 'POST volunteer' do
    def create_volunteer
      post :create, volunteer: FactoryGirl.attributes_for(:user), type: "Volunteer"
    end

    it 'creates an volunteer' do
      expect{ create_volunteer }.to change { Volunteer.count }.by(1)
    end
  end
end
