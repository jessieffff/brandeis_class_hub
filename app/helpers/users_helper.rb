module UsersHelper

  # Returns the Gravatar for the given user.
  # TEMP - We can replace this as needed.
    def gravatar_for(user, size: 80)
      gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = user.avatar_url
      image_tag(gravatar_url, alt: user.full_name, class: "gravatar")
    end
  end