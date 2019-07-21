require 'graphql'
require_relative 'base_object'

module Types
  class ExampleModelType < Types::BaseObject
    field :name, String, null: true
    field :description, String, null: true
  end
end
