require_dependency 'mutations/message_mutation'

module Types
  class MutationType < Types::BaseObject

    field :send_message, mutation: Mutations::SendMessage

  end
end
