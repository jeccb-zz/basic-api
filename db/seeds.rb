(1..10).each do |count|
   Post.create(title: "titulo #{count}", body: "conteudo")
   puts "Post #{count} created!"
end
