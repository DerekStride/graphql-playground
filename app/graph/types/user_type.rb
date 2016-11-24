UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'User like yourself'
  field :email, types.String

  connection :authors do
    type AuthorType.connection_type
    argument :first, !types.Int
    resolve -> (user, args, _) {
      user.authors.first(args[:first])
    }
  end
end
