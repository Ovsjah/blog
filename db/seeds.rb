categories = FactoryBot.create_list(:category, 5)
posts = categories.map { |category| FactoryBot.create_list(:post, 2, :with_file, category: category) }

categories.each { |category| FactoryBot.create_list(:comment, 3, category: category) }
posts.flatten.each { |post| FactoryBot.create_list(:post_comment, 5, post: post) }
