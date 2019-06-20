# rspec app_spec.rb

require 'rspec'
require_relative './app.rb'

RSpec.describe "Prices calculator", type: :model do
  let(:data)          { JSON.parse(File.read('data.json')) }
  let(:output)        { JSON.parse(File.read('output.json')) }


end

RSpec.describe "Price of communication", type: :model do
  describe '#price' do

    it "a communication with a practitioner whitout express_delivery should cost 0.10€" do
      com = Communication.new({
        'id' => 1,
        'practitioner_id' => 1,
        'pages_number' => 1,
        'color' => false,
        'sent_at' => "2019-03-01 10:00:00"
      })
      com.practitioner = Practitioner.new(
        'id' => 1,
        'first_name' => "Gregory",
        'last_name' => "House",
        'express_delivery' => false,
      )
      expect(com.price).to eq(0.10)
    end
  end
end
