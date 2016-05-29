require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:test_post) { create(:post) }

  let(:valid_attributes) {
    {
      "body" => "test_body",
      "commentable_type" => 'Post',
      "commentable_id" => test_post.id,
    }
  }

  let(:invalid_attributes) {
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all comments as @comments" do
      sign_in user
      comment = user.comments.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        sign_in user
        expect {
          post :create, {:comment => valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        sign_in user
        post :create, {:comment => valid_attributes}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created comment" do
        sign_in user
        post :create, {:comment => valid_attributes}, valid_session
        expect(response).to redirect_to(:root)
      end
    end
  end
end
