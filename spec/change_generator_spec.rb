require 'change_generator'

describe ChangeGenerator do
  context '#separate_pounds_and_pence' do
    it 'gets 12.00 and return an array with pounds and pence' do
      change_generator = ChangeGenerator.new(12.00)
      expect(change_generator.separate_pound_and_pence).to eq(["12", "0"])
    end
  end

  context '#pounds_into_notes_and_coins' do
    it 'gets 12.00 and return ["£10", "£2"]' do
      change_generator = ChangeGenerator.new(12.00)
      change_generator.separate_pound_and_pence
      expect(change_generator.pound_change).to eq(["£10", "£2"])
    end

    it 'gets 13.00 and return ["£10", "£2", "£1"]' do
      change_generator = ChangeGenerator.new(13.00)
      change_generator.separate_pound_and_pence
      expect(change_generator.pound_change).to eq(["£10", "£2", "£1"])
    end

    it 'gets 50.00 and return ["£50"]' do
      change_generator = ChangeGenerator.new(50.00)
      change_generator.separate_pound_and_pence
      expect(change_generator.pound_change).to eq(["£50"])
    end

    it 'gets 100.00 and return ["£50", "£50"]' do
      change_generator = ChangeGenerator.new(100.00)
      change_generator.separate_pound_and_pence
      expect(change_generator.pound_change).to eq(["£50", "£50"])
    end

    it 'gets 113.00 and return ["£50", "£50", "£10", "£2", "£1"]' do
      change_generator = ChangeGenerator.new(113.00)
      change_generator.separate_pound_and_pence
      expect(change_generator.pound_change).to eq(["£50", "£50", "£10", "£2", "£1"])
    end

    it '#pence_change gets £100.12 and return ["10p", "2p"]' do
      change_generator = ChangeGenerator.new(100.12)
      change_generator.separate_pound_and_pence
      expect(change_generator.pence_change).to eq(["10p", "2p"])
    end

    it 'gets 100.12 and return ["£50", "£50", "10p", "2p"]' do
      change_generator = ChangeGenerator.new(100.12)
      expect(change_generator.give_me_the_change).to eq(["£50", "£50", "10p", "2p"])
    end

    it 'gets 113.73 and return ["£50", "£50", "£10", "£2", "£1", "50p", "20p", "2p", "1p"]' do
      change_generator = ChangeGenerator.new(113.73)
      expect(change_generator.give_me_the_change).to eq(["£50", "£50", "£10", "£2", "£1", "50p", "20p", "2p", "1p"])
    end

    it 'gets 0.73 and return ["50p", "20p", "2p", "1p"]' do
      change_generator = ChangeGenerator.new(0.73)
      expect(change_generator.give_me_the_change).to eq(["50p", "20p", "2p", "1p"])
    end
  end
end
