module ApplicationHelper

def admin?
  if current_user
    if current_user.admin == true
      return true
    end
  end
end

end
