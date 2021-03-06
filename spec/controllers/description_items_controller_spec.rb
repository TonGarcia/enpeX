require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DescriptionItemsController do

  # This should return the minimal set of attributes required to create a valid
  # DescriptionItem. As you add validations to DescriptionItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DescriptionItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all description_items as @description_items" do
      description_item = DescriptionItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:description_items).should eq([description_item])
    end
  end

  describe "GET show" do
    it "assigns the requested description_item as @description_item" do
      description_item = DescriptionItem.create! valid_attributes
      get :show, {:id => description_item.to_param}, valid_session
      assigns(:description_item).should eq(description_item)
    end
  end

  describe "GET new" do
    it "assigns a new description_item as @description_item" do
      get :new, {}, valid_session
      assigns(:description_item).should be_a_new(DescriptionItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested description_item as @description_item" do
      description_item = DescriptionItem.create! valid_attributes
      get :edit, {:id => description_item.to_param}, valid_session
      assigns(:description_item).should eq(description_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DescriptionItem" do
        expect {
          post :create, {:description_item => valid_attributes}, valid_session
        }.to change(DescriptionItem, :count).by(1)
      end

      it "assigns a newly created description_item as @description_item" do
        post :create, {:description_item => valid_attributes}, valid_session
        assigns(:description_item).should be_a(DescriptionItem)
        assigns(:description_item).should be_persisted
      end

      it "redirects to the created description_item" do
        post :create, {:description_item => valid_attributes}, valid_session
        response.should redirect_to(DescriptionItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved description_item as @description_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        DescriptionItem.any_instance.stub(:save).and_return(false)
        post :create, {:description_item => { "title" => "invalid value" }}, valid_session
        assigns(:description_item).should be_a_new(DescriptionItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DescriptionItem.any_instance.stub(:save).and_return(false)
        post :create, {:description_item => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested description_item" do
        description_item = DescriptionItem.create! valid_attributes
        # Assuming there are no other description_items in the database, this
        # specifies that the DescriptionItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DescriptionItem.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => description_item.to_param, :description_item => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested description_item as @description_item" do
        description_item = DescriptionItem.create! valid_attributes
        put :update, {:id => description_item.to_param, :description_item => valid_attributes}, valid_session
        assigns(:description_item).should eq(description_item)
      end

      it "redirects to the description_item" do
        description_item = DescriptionItem.create! valid_attributes
        put :update, {:id => description_item.to_param, :description_item => valid_attributes}, valid_session
        response.should redirect_to(description_item)
      end
    end

    describe "with invalid params" do
      it "assigns the description_item as @description_item" do
        description_item = DescriptionItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DescriptionItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => description_item.to_param, :description_item => { "title" => "invalid value" }}, valid_session
        assigns(:description_item).should eq(description_item)
      end

      it "re-renders the 'edit' template" do
        description_item = DescriptionItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DescriptionItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => description_item.to_param, :description_item => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested description_item" do
      description_item = DescriptionItem.create! valid_attributes
      expect {
        delete :destroy, {:id => description_item.to_param}, valid_session
      }.to change(DescriptionItem, :count).by(-1)
    end

    it "redirects to the description_items list" do
      description_item = DescriptionItem.create! valid_attributes
      delete :destroy, {:id => description_item.to_param}, valid_session
      response.should redirect_to(description_items_url)
    end
  end

end
