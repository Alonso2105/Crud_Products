require 'rails_helper'

RSpec.describe Product, type: :model do
  # Contexto para pruebas de validaciones
  context "validations" do
    it "is valid with valid attributes" do
      product = Product.new(
        name: "Green Chilli",
        price: 15.00,
        sku: 1,
        is_seasonal: false,
        quantity: "100 gms",
        category: "vegetables"
      )
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product = Product.new(price: 15.00, sku: 1)
      expect(product).to_not be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is not valid without a price" do
      product = Product.new(name: "Green Chilli", sku: 1)
      expect(product).to_not be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is not valid without a SKU" do
      product = Product.new(name: "Green Chilli", price: 15.00)
      expect(product).to_not be_valid
      expect(product.errors[:sku]).to include("can't be blank")
    end

    it "is not valid with a non-unique SKU" do
      Product.create!(
        name: "Green Chilli",
        price: 15.00,
        sku: 1,
        is_seasonal: false,
        quantity: "100 gms",
        category: "vegetables"
      )
      product = Product.new(
        name: "Red Chilli",
        price: 20.00,
        sku: 1
      )
      expect(product).to_not be_valid
      expect(product.errors[:sku]).to include("has already been taken")
    end

    it "is not valid with a price less than or equal to 0" do
      product = Product.new(
        name: "Green Chilli",
        price: -5.00,
        sku: 2,
        quantity: "100 gms"
      )
      expect(product).to_not be_valid
      expect(product.errors[:price]).to include("must be greater than 0")
    end

    it "is not valid with a name longer than 100 characters" do
      long_name = "a" * 101
      product = Product.new(
        name: long_name,
        price: 15.00,
        sku: 2,
        quantity: "100 gms"
      )
      expect(product).to_not be_valid
      expect(product.errors[:name]).to include("is too long (maximum is 100 characters)")
    end

    it "is not valid if is_seasonal is not a boolean" do
      product = Product.new(
        name: "Green Chilli",
        price: 15.00,
        sku: 2,
        is_seasonal: nil,
        quantity: "100 gms"
      )
      expect(product).to_not be_valid
      expect(product.errors[:is_seasonal]).to include("is not included in the list")
    end
  end
end
