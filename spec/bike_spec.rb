require 'bike'

describe Bike do
  subject(:bike) {described_class.new}
  it{is_expected.to respond_to :working?}

  it 'should see if a bike is working' do
    expect(bike).to be_working
  end
end
