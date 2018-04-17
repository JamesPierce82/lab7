for i in 1..10
  @user = User.new
  first_name = "#{Faker::Name.first_name}"
  last_name = "#{Faker::Name.last_name}"
  @user.email = Faker::Internet.free_email("#{first_name}.#{last_name}")
  @user.password = "Test1234!"
  if @user.save
    p "#{@user.email} has been saved"
    for i in 1..10
      @article = Article.new
      @article.user = @user
      @article.title = "Will #{Faker::Company.name} really #{Faker::Company.bs}?"
      paragraph_1 = Faker::Lorem.paragraphs.join(' ')
      paragraph_2 = Faker::Lovecraft.paragraphs.join(' ')
      paragraph_3 = Faker::Hipster.paragraphs.join(' ')
      @article.content = "#{paragraph_1} <br /> #{paragraph_2} <br /> #{paragraph_3}"
      if @article.save
        p "#{@article.title} has been saved"
        for ii in 1..10
          @comment = Comment.new
          @comment.user = @user
          @comment.article = @article
          @comment.message = Faker::Hacker.say_something_smart
          if @comment.save
            p "Comment #{ii} has been saved for article #{@article.title}"
          else
            p @comment.errors
          end
        end
      else
        p @article.errors
      end
    end
  end
end
