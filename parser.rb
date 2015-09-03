require "nokogiri"

class DictParser
	def parse_get_langs(response)
		response.to_s.scan(/..-../)
	end
	def parse_lookup(response)
		doc = Nokogiri::XML(response.body)
		arr = doc.xpath("//text")
		newarr = arr.map do |str|
			str.to_s.sub("<text>", "").sub("</text>", "")
		end
		newarr
	end
	def func
		[1,2,3]
	end
end
