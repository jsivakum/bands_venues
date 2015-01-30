require("spec_helper")

describe Venue do
  it {should have_and_belong_to_many :bands}

  it "validates the presence of name of Venue" do
    venue = Venue.new({:name => ""})
    expect(venue.save).to eq false
  end

  it "ensures a titleized name" do
    venue = Venue.create({:name => "cat's tail"})
    expect(venue.name).to eq "Cat's Tail"
  end
end
