# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Faker::Config.locale = :ru
 10.times do
    @emails = ["new@new.com", "mevain@example.org", "user1@example.org", "user2@example.org", "user3@example.org", "user4@example.org", 
    "user5@example.org", "user6@example.org", "user7@example.org", "user8@example.org", "user9@example.org", "user10@example.org" ]
    @names = ["new", "mevain", "user1", "user2", "user3", "user4", "user5"]
    @genres = ["Роман", "Поэзия", "Фэнтези", "Детектив", "Триллер", "Биография", "Пьеса", "Рассказ", "Для детей", "Романтика"]
    @id = rand(1...12)
    @name = Faker::Book.title
    @author = @names[@id - 1]
    @author_email = @emails[@id - 1];
    @year = rand(2021...2022)
    @genre = @genres.sample
    @description = "Автор еще не добавил описание"
    @content = ''
    rand(1..500).times do
        @content.concat(Faker::Lorem.paragraph)
    end
    @language = 'English'
    Book.create(genre: @genre, name: @name, author: @author, year: @year, description: @description, content: @content, language: @language, author_email: @author_email, user_id: @id)
end

10.times do
    Publisher.create(pub_house: Faker::Book.publisher)
end

1.upto(User.count) do |i|
    @publisher = rand(1...10)
    Membership.create(user_id: i, publisher_id: @publisher)
end