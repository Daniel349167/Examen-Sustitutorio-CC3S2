# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (RottenPotatoes )?home\s?page$/
      '/movies'


    when /^the edit page for "(.*)"/
      movie = Movie.find_by!(title: $1)
      edit_movie_path(movie)
    when /^the details page for "(.*)"/
      movie = Movie.find_by!(title: $1)
      movie_path(movie)

    when /the Similar Movies page for "(.*)"/
      movie = Movie.find_by!(title: $1)
      similar_movies_path(movie)

    when /the Add new movie page/
      new_movie_path

    when /the All Movies page/
      movies_path

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
