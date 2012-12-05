def full_title(page_title)
	base_title='Sports & Entertainmnet Pools and Fantasy Leagues'
	if page_title.empty?
		base_title
	else "#{base_title} | #{page_title}"
	end
end