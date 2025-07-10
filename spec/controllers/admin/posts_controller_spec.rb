require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
	
	let(:valid_attributes) {create(:post)}
	let(:admin_user) { create(:admin_user) }
	before do
  	sign_in admin_user
  end

	# describe "GET admin/posts" do
	# 	let(:post) {create(:post)}
	# 	before do
	# 		3.times.each do |i|
	# 			create(:post, title: "POST#{i}")
	# 		end
	# 	end

	# 	it "assigns @posts" do
	# 		get :index
  #     expect(response).to have_http_status(:ok)
	# 		expect(assigns(:posts).count).to eq(3)
	# 	end
	# end

	# describe "POST create" do
	# 	let(:valid_attributes) { attributes_for(:post) }
	# 	let(:invalid_attributes) {{title: '', description: '', is_status: ''}}
	# 	context "with valid parameter" do
	# 		it "create a new post" do		
	# 			expect {
	# 				    	post :create, params: { post: valid_attributes }
	# 							}.to change(Post, :count).by(1)
	# 		end

	# 		it "redirected to the created post" do
	# 			post :create, params: {post: valid_attributes}
	# 			expect(response).to redirect_to(admin_post_path(assigns(:post)))
	# 		end
	# 	end

	# 		context "with invalid parameter" do
	# 		it " do not create a new post" do		
	# 			expect {
	# 				    	post :create, params: { post: invalid_attributes }
	# 							}.to_not change(Post, :count)
	# 		end

	# 		it "re-render to new template" do
	# 			post :create, params: {post: invalid_attributes}
	# 			expect(response).to render_template(:new)
	# 		end
	# 	end
	# end

	# describe "GET show" do
	# 	let(:post) {create(:post)}
	# 	context "with valid id" do
	# 		it "get success response" do
	# 			get :show, params: {id: post.id}
	# 			expect(response).to be_successful
	# 		end

	# 		it "is redirect_to to show page" do
	# 			get :show, params: {id: post.id}
	# 			expect(response).to render_template(:show)
	# 		end
	# 	end		
	# end

	describe "PUT update" do
		let(:post) {create(:post)}
		context "with valid id" do
			it "get success response" do
				put :update, params: {id: post.id, post: {title: "updated title", description: "updated", is_status: true}}
				post.reload
				expect(post.title).to eq("updated title")
				expect(response.status).to eq(302)
			end
		end
	end

	# describe "DELETE destroy" do
	# 	let(:post) {create(:post)}
	# 	context "with valid id" do
	# 		it "deleted success" do
	# 			delete :destroy, params: {id: post.id}
	# 			expect(Post.find_by(title:"aaaa")).to be_nil 
	# 		end
	# 	end
	# end

	describe "PUT toggle_status" do
			let(:post) {create(:post)}
			it "for change to is_status" do
				put :toggle_status, params: {id: post.id, post: {is_status: !post.is_status}}
				post.reload
				expect(post.is_status).to eq(false)
			end
	end
end 