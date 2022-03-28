module ApplicationHelper
    def active_link_to name, path
        link_to name, path, class: "#{ 'active' if current_page? path } nav-link text-white"
    end

    def get_user userId
        return User.find(userId)
    end
end
