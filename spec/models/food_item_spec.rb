require 'spec_helper'

describe FoodItem do
  let(:blanks) {[nil, '']}
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should have_valid(:title).when('Salami') }
  it { should_not have_valid(:title).when(*blanks) }

  it { should have_valid(:description).when('Salami') }
  it { should_not have_valid(:description).when(*blanks) }

  it { should validate_numericality_of :inventory}

  it { should have_valid(:inventory).when(4,0)}
  it { should_not have_valid(:inventory).when('taco', nil, '')}

  it "doesn't allow duplicates" do
    FactoryGirl.create(:food_item)
    expect{ FactoryGirl.create(:food_item) }.to raise_error
  end
end
