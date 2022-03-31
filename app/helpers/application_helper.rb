module ApplicationHelper
    def active_link_to name, path
        link_to name, path, class: "#{ 'active' if request.path.split("/")[1] == path.split("/")[1] } nav-link text-white"
    end

    def get_user userId
        return User.find(userId)
    end

    def get_post postId
        return Feed.find(postId)
    end
end
