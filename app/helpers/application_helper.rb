module ApplicationHelper
    def active_link_to name, path
        link_to name, path, class: "#{/} nav-link text-white"
    end
end
