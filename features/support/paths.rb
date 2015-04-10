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
      
    when /^the portal login page$/ then new_member_session_path
    when /^the portal sign-up page$/ then new_member_registration_path
    when /^the portal dashboard for "(.+)"$/ then members_dashboard_home_path(Member.where(first_name: $1)[0])
    when /^the announcements tab for "(.+)"$/ then members_announcements_path(Member.where(first_name: $1)[0])
    when /^the stats page for "(.+)"$/ then members_stats_path(Member.where(first_name: $1)[0])
    when /^the fail sign up page$/ then member_registration_path
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