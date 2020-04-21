require './board.rb'

describe "board" do
	context "top row is full" do
		board = Board.new()
		board.set_value("top", "right", "X")
		board.set_value("top", "center", "X")
		board.set_value("top", "left", "X")
		
		it "returns true when top row is complete" do
			expect(board.line_complete?("X")).to eql(true)
		end

		it "doesn't accept new elements on top" do
			expect(board.valid_move?("top", "center")).to eq(false)
		end

		it "returns false for stalemate" do
			expect(board.stalemate?()).to eq(false)
		end

		it "returns false for bad input" do
			expect(board.understands?("dang","top")).to eq([false, false])
		end

		it "returns true for good input" do
			expect(board.understands?("middle", "center")).to eq([true,true])
		end
	end
end
