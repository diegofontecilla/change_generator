require 'change_generator'

describe ChangeGenerator do
  context '#separate_pounds_and_pence' do
    it 'gets 12.00 and return an array with pounds and pence' do
      change_generator = ChangeGenerator.new(12.00)
      expect(change_generator.separate_pounds_and_pence).to eq(["12", "0"])
    end
  end

  context '#pounds_into_notes' do
    it 'gets 12.00 and return ["£10", "2"]' do
      change_generator = ChangeGenerator.new(12.00)
      change_generator.separate_pounds_and_pence
      expect(change_generator.pound_change).to eq ["£10", "£2"]
    end
  end
end
