module ApplicationHelper

  def flash_messages
    %w(notice warning error).each do |msg|
      concat content_tag(:div, content_tag(:p, flash[msg.to_sym]),
        :class => "message #{msg}") unless flash[msg.to_sym].blank?
    end
  end

  def is_subdomian?(subdomain)
    subdomain.present? && subdomain != "www"
  end

  def is_active_tab?(tab)
    @active_tab == tab
  end

end
