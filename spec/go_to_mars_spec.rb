require 'spec_helper'
describe "test go to mars" do
  it "can not init with new method" do
    expect(GoToMars.methods(false)).to eq([:land_at, :out_of_empire?])
  end

  it "can find the region of PRC" do
    expect(GoToMars.out_of_empire?(57.984808, 104.758759)).to be true
    expect(GoToMars.out_of_empire?(38.582526, 109.109344)).to be false
  end

  it "can change wgs84 to gcj02" do
    expect(GoToMars.land_at(57.984808, 104.758759)).to eq([57.984808, 104.758759])
    expect(GoToMars.land_at(39.909745000000, 116.359496000000)).to eq([39.911112866392486, 116.36569790916941])
  end
end