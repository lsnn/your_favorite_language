class LanguagesController < ApplicationController
  def home
  end

  def search
    @username = params[:username]
    languages = GitHubService.get_all_languages(@username)
    @favorite_language = languages.max_by { |k, v| v }[0]
  end
end