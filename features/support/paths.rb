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

    when /^the home\s?page$/
      '/'
    when /^the admin login page$/
      '/admins/sign_in'
    when /^the la login page$/
      '/lab_assistants/sign_in'
    when /^the forgot password page$/
      '/admins/password/new'
    when /^the admin dashboard page$/
      '/admins/dashboard'
    when /^the la dashboard page$/
      '/lab_assistants/dashboard'
    when /^the verification page$/
      '/admins/dashboard'
    when /^the teaching assistant login page$/
      '/teaching_assistants/sign_in'
    when /^the teaching assistant dashboard page$/
      '/teaching_assistants/dashboard'
    when /^the contract form page$/
      '/lab_assistants/contract/sign_up'
    when /^the first lab time page$/
      '/lab_times/42'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

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
