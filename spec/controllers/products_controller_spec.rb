require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:product) { Product.create(name: "Green Chilli", price: 15.00, sku: 1, is_seasonal: false, quantity: "100 gms", category: "vegetables") }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: product.id }
      expect(response).to be_successful
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: product.id }
      expect(response).to be_successful
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) do
        { name: "Red Chilli", price: 20.00, sku: 2, is_seasonal: true, quantity: "200 gms", category: "vegetables" }
      end

      it "creates a new Product" do
        expect {
          post :create, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, params: { product: valid_attributes }
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        { name: "", price: 20.00, sku: 2, is_seasonal: true, quantity: "200 gms", category: "vegetables" }
      end

      it "does not create a new Product" do
        expect {
          post :create, params: { product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end

      it "renders the new template" do
        post :create, params: { product: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: "Yellow Chilli", price: 25.00, sku: 3, is_seasonal: false, quantity: "300 gms" }
      end

      it "updates the requested product" do
        put :update, params: { id: product.id, product: new_attributes }
        product.reload
        expect(product.name).to eq("Yellow Chilli")
        expect(product.price).to eq(25.00)
      end

      it "redirects to the product" do
        put :update, params: { id: product.id, product: new_attributes }
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        { name: "", price: 25.00, sku: 3, is_seasonal: false, quantity: "300 gms" }
      end

      it "does not update the product" do
        put :update, params: { id: product.id, product: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to(products_url)
    end
  end
end
