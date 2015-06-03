require 'rspec'
require '../lib/PostRepository'

describe PostRepository do
  
  before(:context) do
    @repository = PostRepository.new
  end
  
  it "should load the data file inmediatly :|" do
    posts = @repository.all()
    expect(posts.length).to be > 0
  end
  
  it "should return posts by id" do
    post = @repository.getById(1)
    first_post = @repository.all()[0]
    expect(post).to be_truthy
    expect(post).to eq(first_post)
  end
  
  it "should return posts by author" do
    posts = @repository.getByAuthor('Pixelated')
    expect(posts.length).to eq(2)
  end
  
  it "should return posts by tag" do
    posts = @repository.getByTag('fitness')
    expect(posts.length).to eq(2)
  end
  
  it "should return tags with frequency" do
    tags = @repository.getAllTags()
    expect(tags['fitness']).to eq(2)
    expect(tags['sports']).to eq(1)
    expect(tags['cooking']).to eq(1)
    expect(tags['recreation']).to eq(1)
  end
end