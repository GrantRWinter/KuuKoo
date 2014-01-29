module ApplicationHelper

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


# http://stackoverflow.com/questions/9381817/devise-sign-up-form-on-the-home-page-as-well

end
