require 'spec_helper'

describe DictionaryAPI do
	
  it "get_langs" do	
		dict = DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
		dict.get_langs.size.should eq 86
		dict.get_langs.should include('en-ru')
		dict.get_langs.should include('ru-en')
	end

	it "lookup" do
		dict = DictionaryAPI::DictionaryAPI.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
		response = dict.lookup('en-ru', 'time')
		response.size.should eq 3
		response[0].text.should_not be_nil
		response[0].position.should_not be_nil
		response[0].transcription.should_not be_nil
		response[0].translation.should_not be_nil
	end

	it "check errors" do
		dict = DictionaryAPI::DictionaryAPI.new('q9fjq9fjioj')
		expect{ dict.lookup('en-ru', 'time') }.to raise_error(Exception)
	end
end
