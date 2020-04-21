require './game.rb'

describe "game" do
	it "returns correct player depending on char" do
		game = Game.new()
		expect(game.char_to_player("X")).to eq("Player 1")
	end
end


