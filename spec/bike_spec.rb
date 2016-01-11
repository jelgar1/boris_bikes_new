require 'bike'

describe Bike do
  subject(:bike) {described_class.new}

  it 'should see if a bike is working' do
    expect(bike.working).to eq(true)
  end

  it 'should report a bike as broken' do
    bike.broken
    expect(bike.working).to eq(false)
  end
end
