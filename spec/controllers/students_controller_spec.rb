require 'spec_helper'

describe StudentsController do
  render_views

  describe 'GET index' do
    let!(:student) { create(:student_role).user }


    it 'returns json representation of user with student role' do
      get :index, format: :json
      expect(assigns(:students)).to eq [student]
    end
  end

end
