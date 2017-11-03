# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
moderator = Moderator.create(fullname: "Pawel Stef", username: "p@p", password: "p")

30.times do 
  post = Post.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph,
    published_at: DateTime.now,
    publish: true,
    moderator: moderator)

  tag = Tag.create(name: Faker::Book.genre)
  
  post_tag = PostTag.create(post: post, tag: tag)
  
  visitor = Visitor.create(fullname: Faker::Name.name, email: Faker::Internet.email)

  comment = Comment.create(
    message: Faker::Lorem.paragraph,
    status: [true, false].sample,
    post: post,
    visitor: visitor)
  
  message = Message.create(
    content: Faker::Lorem.paragraph,
    status: [true, false].sample,
    visitor: visitor
  )

  notifiable = [visitor, comment].sample

  notification = Notification.create(
    notifiable_id: notifiable.id,
    notifiable_type: notifiable.class.name)

end


5.times do

  review = Review.create(
    content: Faker::Lorem.paragraph,
    draft: false)

  book = Book.create( 
    title: Faker::Book.title,
    author_fname: Faker::Name.first_name,
    author_lname: Faker::Name.last_name,
    publisher: Faker::Book.publisher,
    publish_year: Faker::Number.between(1940, 2016),
    isbn:  Faker::Code.isbn,
    review: review)

end
