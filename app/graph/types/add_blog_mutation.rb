AddBlogMutation = GraphQL::Relay::Mutation.define do
  name 'AddBlog'

  input_field :author_id, !types.ID
  input_field :title, !types.String
  input_field :content, !types.String

  return_field :blog, BlogType

  resolve ->(_, inputs, ctx) do
    author = ctx[:user].authors.find(inputs[:author_id])

    { blog: author.blogs.create!(title: inputs[:title], content: inputs[:content]) }
  end
end
