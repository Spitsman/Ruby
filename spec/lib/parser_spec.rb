require 'spec_helper'

describe Parser do 
	
	it 'parse' do
		key = 'dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e'
		client = DictionaryAPI::Client.new(key)
		response = JSON.parse(client.execute('lookup', ['en-ru', 'time']).body)
		parser = DictionaryAPI::Parser.new
		parser.parse(response).size.should eq 3
	end
	
end