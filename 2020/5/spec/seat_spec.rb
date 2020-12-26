# frozen_string_literal: true

require "seat"

describe Seat do
  it "calculates correctly FBFBBFFRLR" do
    seat = Seat.new("FBFBBFFRLR")
    expect(seat.row).to eq(44)
    expect(seat.col).to eq(5)
    expect(seat.id).to eq(357)
  end
end
