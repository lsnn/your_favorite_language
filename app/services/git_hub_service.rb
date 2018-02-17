class GitHubService
  include HTTParty
  base_uri 'https://api.github.com'

  def self.get_all_languages(username)
    @username = username
    bytes_per_language
  end

  private

  def self.bytes_per_language
    bytes_per_language = Hash.new(0)
    repos.each do |repo|
      languages(repo).each { |language, bytes| bytes_per_language[language] += bytes }
    end
    bytes_per_language
  end

  def self.languages(repo)
    languages = get("/repos/#{@username}/#{repo["name"]}/languages", headers: headers)
    languages.parsed_response
  end

  def self.repos
    get("/users/#{@username}/repos", headers: headers)
  end

  def self.headers
    {
      'Accept' => 'application/vnd.github.v3+json',
      'User-Agent' => 'testapp'
    }
  end
end
