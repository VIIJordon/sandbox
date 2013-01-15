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

describe FormTypesController do

  # This should return the minimal set of attributes required to create a valid
  # FormType. As you add validations to FormType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FormTypesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all form_types as @form_types" do
      form_type = FormType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:form_types).should eq([form_type])
    end
  end

  describe "GET show" do
    it "assigns the requested form_type as @form_type" do
      form_type = FormType.create! valid_attributes
      get :show, {:id => form_type.to_param}, valid_session
      assigns(:form_type).should eq(form_type)
    end
  end

  describe "GET new" do
    it "assigns a new form_type as @form_type" do
      get :new, {}, valid_session
      assigns(:form_type).should be_a_new(FormType)
    end
  end

  describe "GET edit" do
    it "assigns the requested form_type as @form_type" do
      form_type = FormType.create! valid_attributes
      get :edit, {:id => form_type.to_param}, valid_session
      assigns(:form_type).should eq(form_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FormType" do
        expect {
          post :create, {:form_type => valid_attributes}, valid_session
        }.to change(FormType, :count).by(1)
      end

      it "assigns a newly created form_type as @form_type" do
        post :create, {:form_type => valid_attributes}, valid_session
        assigns(:form_type).should be_a(FormType)
        assigns(:form_type).should be_persisted
      end

      it "redirects to the created form_type" do
        post :create, {:form_type => valid_attributes}, valid_session
        response.should redirect_to(FormType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved form_type as @form_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        FormType.any_instance.stub(:save).and_return(false)
        post :create, {:form_type => { "name" => "invalid value" }}, valid_session
        assigns(:form_type).should be_a_new(FormType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FormType.any_instance.stub(:save).and_return(false)
        post :create, {:form_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested form_type" do
        form_type = FormType.create! valid_attributes
        # Assuming there are no other form_types in the database, this
        # specifies that the FormType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FormType.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => form_type.to_param, :form_type => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested form_type as @form_type" do
        form_type = FormType.create! valid_attributes
        put :update, {:id => form_type.to_param, :form_type => valid_attributes}, valid_session
        assigns(:form_type).should eq(form_type)
      end

      it "redirects to the form_type" do
        form_type = FormType.create! valid_attributes
        put :update, {:id => form_type.to_param, :form_type => valid_attributes}, valid_session
        response.should redirect_to(form_type)
      end
    end

    describe "with invalid params" do
      it "assigns the form_type as @form_type" do
        form_type = FormType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FormType.any_instance.stub(:save).and_return(false)
        put :update, {:id => form_type.to_param, :form_type => { "name" => "invalid value" }}, valid_session
        assigns(:form_type).should eq(form_type)
      end

      it "re-renders the 'edit' template" do
        form_type = FormType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FormType.any_instance.stub(:save).and_return(false)
        put :update, {:id => form_type.to_param, :form_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested form_type" do
      form_type = FormType.create! valid_attributes
      expect {
        delete :destroy, {:id => form_type.to_param}, valid_session
      }.to change(FormType, :count).by(-1)
    end

    it "redirects to the form_types list" do
      form_type = FormType.create! valid_attributes
      delete :destroy, {:id => form_type.to_param}, valid_session
      response.should redirect_to(form_types_url)
    end
  end

end
