module DiscussionsHelper
    def get_user userId
        return User.find(userId)
    end
end
