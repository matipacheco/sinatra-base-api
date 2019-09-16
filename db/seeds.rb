require_relative '../app/models/user'
require_relative '../app/models/example_model'

User.first_or_create(email: 'test@test.test', password: '123456test')

ExampleModel.first_or_create(name: 'Example name 1', description: 'Example description 1')
ExampleModel.first_or_create(name: 'Example name 2', description: 'Example description 2')
ExampleModel.first_or_create(name: 'Example name 3', description: 'Example description 3')