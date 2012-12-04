module ApplicationHelper

	def full_title(page_title)
		base_title='Sports & Entertainmnet Pools and Fantasy League'
		if page_title.empty?
			base_title
		else
			return "#{base_title} | #{page_title}"
		end
	end

	def us_states
      {"United States"=>
    [
      ['AL', 'AL'],
      ['AK', 'AK'],
      ['AZ', 'AZ'],
      ['AR', 'AR'],
      ['CA', 'CA'],
      ['CO', 'CO'],
      ['CT', 'CT'],
      ['DE', 'DE'],
      ['DC', 'DC'],
      ['FL', 'FL'],
      ['GA', 'GA'],
      ['HI', 'HI'],
      ['ID', 'ID'],
      ['IL', 'IL'],
      ['IN', 'IN'],
      ['IA', 'IA'],
      ['KS', 'KS'],
      ['KY', 'KY'],
      ['LA', 'LA'],
      ['ME', 'ME'],
      ['MD', 'MD'],
      ['MA', 'MA'],
      ['MI', 'MI'],
      ['MN', 'MN'],
      ['MS', 'MS'],
      ['MO', 'MO'],
      ['MT', 'MT'],
      ['NE', 'NE'],
      ['NV', 'NV'],
      ['NH', 'NH'],
      ['NJ', 'NJ'],
      ['NM', 'NM'],
      ['NY', 'NY'],
      ['NC', 'NC'],
      ['ND', 'ND'],
      ['OH', 'OH'],
      ['OK', 'OK'],
      ['OR', 'OR'],
      ['PA', 'PA'],
      ['PR', 'PR'],
      ['RI', 'RI'],
      ['SC', 'SC'],
      ['SD', 'SD'],
      ['TN', 'TN'],
      ['TX', 'TX'],
      ['UT', 'UT'],
      ['VT', 'VT'],
      ['VA', 'VA'],
      ['WA', 'WA'],
      ['WV', 'WV'],
      ['WI', 'WI'],
      ['WY', 'WY']],
      "Canada" =>
      [["Alberta", "Alberta (AB)"],
      ["British Columbia", "British Columbia (BC)"],
      ["Manitboa", "Manitoba (MB)"],
      ["New Brunswick", "New Brunswick (NB)"],
      ["Newfoundland and Labrador", "Newfoundland and Labrador (NL)"],
      ["Northwest Territories", "Northwest Territories (NT)"],
      ["Nova Scotia", "Nova Scotia (NS)"],
      ["Nunavut", "Nunavut (NU)"],
      ["Prince Edward Island", "Prince Edward Island (PE)"],
      ["Saskatchewan", "Saskatchewan (SK)"],
      ["Ontario", "Ontario (ON)"],
      ["Quebec", "Quebec (QC)"],
      ["Yukon", "Yukon (YT)"]]}
end


def unsorted_grouped_options_for_select(us_states, selected_key = nil, prompt = nil)
  body = ''
  body << content_tag(:option, prompt, { :value => "" }, true) if prompt

  ##Remove sort
  #grouped_options = grouped_options.sort if grouped_options.is_a?(Hash)

 us_states.each do |group|
    body << content_tag(:optgroup, options_for_select(group[1], selected_key), :label => group[0])
  end

  body.html_safe
end
end
