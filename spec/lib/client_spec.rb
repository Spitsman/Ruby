require 'spec_helper'

describe Client do 
	
	it 'execute' do
		key = 'dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e'
		client = Client.new(key)
		JSON.parse(client.execute('getLangs').body).size.should eq 86
	end
	
end