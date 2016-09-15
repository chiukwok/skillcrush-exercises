
class Blog

	@@blog_array = Array.new
	@@total_blog_posts = 0

	def self.add(blog_post)
		@@total_blog_posts +=1
		@@blog_array.push(blog_post)
	end

	def self.publish_all
		@@blog_array.each do |post|
			post.publish
		end
	end

end

#class BlogPost < Blog    # doesn't need / make a sense to inherit from Blog
class BlogPost

	def create(title, date, author, content)
		set_title(title)
		set_content(content)
		set_date(date)
		set_author(author)
	end

	def set_title(title)
		@title_name = title
	end
 
	def get_title
		return @title_name
	end
 
	def set_content(content)
		@content_name = content
	end
 
	def get_content
		return @content_name
	end
 
	def set_date(date)
		@date_name = date
	end
 
	def get_date
		return @date_name
	end

	def set_author(author)
		@author_name = author
	end
 
	def get_author
		return @author_name
	end

	def publish
		puts "Title: #{self.get_title}"
		puts "Published on #{self.get_date} by #{self.get_author}"
		puts "#{self.get_content}"
	end

end



def blog_criteria
	puts "How would you like to name the blog title?" 
	blog_title = gets.chomp
	puts "When will the blog be posted? [MM/DD/YY]" 
	blog_date = gets.chomp
	puts "Who is the author of the post?" 
	blog_author = gets.chomp
	puts "What will the main content be?" 
	blog_content = gets.chomp
	blog_post = BlogPost.new
	blog_post.create(blog_title, blog_date, blog_author, blog_content)
	Blog.add(blog_post)
end

def blog_posting
	try_posting = true
	while (try_posting)
		puts "Do you want to publish or save the content? [P/S]"
		answer = gets.chomp.downcase
		if  (answer.downcase == "p")
			#publish all posts in array3
			Blog.publish_all
			try_posting = false
		elsif (answer.downcase == "s")
			#put in array
			try_posting = false
		else 
			puts "Sorry, please enter [P/S]"
		end
	end
end

def blog_question
	create_post = true
	while (create_post)
		puts "Do you want to create a new blog post? [Y/N]"
		answer = gets.chomp.downcase
		if (answer.downcase == "n")
			puts "Ok thank you, good bye!"
			create_post = false
		elsif (answer.downcase == "y")
			# create and save new blog post
			blog_criteria
			# ask if publish ALL blog posts
			blog_posting
		else
			puts "Sorry, please enter [Y/N]"
		end
	end
end

blog_question

# puts blog_post.inspect

