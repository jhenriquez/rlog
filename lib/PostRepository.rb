require 'json'

class PostRepository
  def initialize
    path  = File.join(File.dirname(__FILE__),'data/posts.json')
    @posts = JSON.parse(File.read path)['posts']
  end
  
  def all
    @posts
  end
  
  def getById(id)
    @posts.select { |p| return p if p["id"] == id }
  end
  
  def getByAuthor(author)
    @posts.select { |p| p['author'] == author }
  end
  
  def getByTag(tag)
    @posts.select { |p| p['tags'].scan(/\w+/).include? tag }
  end
  
  def getAllTags
    @posts.inject(Hash.new(0)) do |tags, post|
      post['tags'].scan(/\w+/).each { |tag| tags[tag] += 1 }
      tags
    end
  end
end