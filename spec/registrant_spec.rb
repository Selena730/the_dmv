require 'rspec'
require './lib/registrant'
require './lib/facility'

describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new("Bruce", 18, true )
    @registrant_2 = Registrant.new("Penny", 15 )
    @registrant_3 = Registrant.new("Tucker", 16)
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do

      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end
  end

  describe '#name' do
    it 'can read the name' do

      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_2.name).to eq("Penny")
    end
  end

  describe '#age' do
    it 'can read age' do

      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end
  end

  describe '#permit?' do
    it 'doesnt have a permit by defult' do

      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe '#permit?' do
    it 'can have a permit' do

      expect(@registrant_1.permit?).to eq(true)
    end
  end

  describe '#license_data' do
    it 'returns the value of license data' do

      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#earn_permit' do
    it 'returns permit as true' do
    @registrant_3.earn_permit

      expect(@registrant_3.permit?).to eq(true)
    end

    it "returns permit as false" do
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe '#AWT' do
    it 'returns AWT true' do
      @registrant_3.earn_permit
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_3)).to eq(true)
    end

    it 'returns AWT false' do
      @registrant_2.earn_permit
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
    end
  end
end
