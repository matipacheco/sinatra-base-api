module Mutations

  # Class that holds the logic that allows us to publish a message in Redis
  # Note: Im using Redis as a messaging system.
  class SendMessage < Mutations::BaseMutation
    argument :body, Types::JsonType, required: true

    def resolve(body:)
      begin
        check_for_participants(body)

        PubSub.publish_message(body)

        { :result => "success" }

      rescue Exception => e
        { :result => "error", :errors => e.as_json }

      end
    end

    private

    def check_for_participants body
      unless body.has_key? "sender"
        raise "Invalid request: Expecting message sender"
      end

      unless body.has_key? "receiver"
        raise "Invalid request: Expecting message receiver"
      end
    end

  end

end
