module ApplicationHelper

	def full_title(page_title)
		base_title='Seth B.\'s College Bowl Pool'
		if page_title.empty?
			base_title
		else
			return "#{base_title} | #{page_title}"
		end
	end
end
