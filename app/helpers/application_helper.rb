module ApplicationHelper
    def active_link_to name, path
        link_to name, path, class: "#{ 'active' if current_page? path } nav-link text-white"
    end
end
