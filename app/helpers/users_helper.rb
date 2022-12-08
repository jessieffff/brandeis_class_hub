module UsersHelper

# Returns the Gravatar for the given user.
# TEMP - We can replace this as needed.
  def gravatar_for(user, size: 80)
    if user.image_url
      gravatar_url = user.image_url
    else
      gravatar_url = "brandeis_logo.png"
    end
    image_tag(gravatar_url, alt: user.first_name, width: 100, class: "gravatar", referrerpolicy:"no-referrer")
  end
end