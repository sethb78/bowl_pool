module ApplicationHelper

	def full_title(page_title)
		base_title='Sports & Entertainmnet Pools and Fantasy Leagues'
		if page_title.empty?
			base_title
		else
			return "#{base_title} | #{page_title}"
		end
	end

	def us_states
      {"United States"=>
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorato', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']],
      "Canada" =>
      [["Alberta", "AB"],
      ["British Columbia", "BC"],
      ["Manitboa", "MB"],
      ["New Brunswick", "NB"],
      ["Newfoundland and Labrador", "NL"],
      ["Northwest Territories", "NT"],
      ["Nova Scotia", "NS"],
      ["Nunavut", "NU"],
      ["Prince Edward Island", "PE"],
      ["Saskatchewan", "SK"],
      ["Ontario", "ON"],
      ["Quebec", "QC"],
      ["Yukon", "YT"]]}
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
