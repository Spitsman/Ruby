require "./yandexapi.rb"
require	 "./parser.rb"

describe "my_test" do 

	context "#return_value" do
		dict = Dictionary.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
		response1 = dict.get_langs
		response2 = dict.lookup('en-ru', 'time')
		test = DictParser.new
		it "test_get_langs" do			
			test.parse_get_langs(response1).should include ("ru-en")
			test.parse_get_langs(response1).should eq ["be-be", "be-ru", "bg-ru", "cs-en", "cs-ru", "da-en", "da-ru", "de-en", "de-ru", "de-tr", "el-en", "el-ru", "en-cs", "en-da", "en-de", "en-el", "en-en", "en-es", "en-et", "en-fi", "en-fr", "en-it", "en-lt", "en-lv", "en-nl", "en-no", "en-pt", "en-ru", "en-sk", "en-sv", "en-tr", "es-en", "es-ru", "et-en", "et-ru", "fi-en", "fi-ru", "fr-en", "fr-ru", "it-en", "it-ru", "lt-en", "lt-ru", "lv-en", "lv-ru", "nl-en", "nl-ru", "no-en", "no-ru", "pl-ru", "pt-en", "pt-ru", "ru-be", "ru-bg", "ru-cs", "ru-da", "ru-de", "ru-el", "ru-en", "ru-es", "ru-et", "ru-fi", "ru-fr", "ru-it", "ru-lt", "ru-lv", "ru-nl", "ru-no", "ru-pl", "ru-pt", "ru-ru", "ru-sk", "ru-sv", "ru-tr", "ru-tt", "ru-uk", "sk-en", "sk-ru", "sv-en", "sv-ru", "tr-de", "tr-en", "tr-ru", "tt-ru", "uk-ru", "uk-uk"]
		end
		it "test_lookup" do
			test.parse_lookup(response2).size.should == 35
			#["time", "время" 'раз', 'срок', 'жизнь', 'timing', 'fold', 'term', 'life', 'moscow time', 'московское время', 'dozen times', 'десяток раз', 'very short time', 'кратчайшие сроки', 'эпоха', 'век', 'epoch', 'age', 'in Victorian times', 'в викторианскую эпоху', 'in medieval times', 'в средние века', 'такт', 'special time', 'особый такт', 'темп', 'tempo', 'time', 'приурочивать', 'рассчитывать', 'time', 'повременный', 'time payment']
		end
	end
end

