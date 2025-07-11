require "swagger_helper"

RSpec.describe "api/v1/products", type: :request do
  path "/api/v1/products" do
    get("list products") do
      tags "Products"
      consumes "application/json"
      produces "application/json"

      response(200, "successful") do
        example "application/json", :product, [
          {
            id: 1,
            title: "T-shirt",
            price: "35.99",
            "created_at": "2025-06-13T17:56:07.979Z",
            "updated_at": "2025-06-13T17:56:07.979Z"
          },
          {
            id: 2,
            title: "Pants",
            price: "60.99",
            "created_at": "2025-06-13T19:56:07.979Z",
            "updated_at": "2025-06-16T13:04:51.471Z"
          }
        ]

        schema type: :array,
          properties: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              price: { type: :string, format: :decimal },
              created_at: { type: :string, format: :date_time },
              updated_at: { type: :string, format: :date_time }
            },
            required: %w[id name price created_at updated_at]
          }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    post("create product") do
      tags "Products"
      consumes "application/json"
      produces "application/json"


      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          product: {
            type: :object,
            properties: {
              name: { type: :string, example: "Toy" },
              price: { type: :string, format: :decimal, example: "123.45" }
            },
            required: [ "name", "price" ]
          }
        },
        required: [ "product" ]
      }

      response(201, "successful") do
        example "application/json", :product, [ {
          id: 1,
          title: "T-shirt",
          price: "35.99",
          "created_at": "2025-06-13T17:56:07.979Z",
          "updated_at": "2025-06-13T17:56:07.979Z"
        } ]

        let(:product) { { product: { name: "t-shirt", price: 35.99 } } }

        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            price: { type: :string, format: :decimal },
            created_at: { type: :string, format: :date_time },
            updated_at: { type: :string, format: :date_time }
          },
          required: %w[id name price created_at updated_at]
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test! do | response |
          data = JSON.parse(response.body)
          expect(data["name"]).to eq("t-shirt")
          expect(data["price"]).to eq("35.99")
        end
      end
    end
  end

  path "/api/v1/products/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id", in: :path, type: :string, description: "id"

    get("show product") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    patch("update product") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    put("update product") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    delete("delete product") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
