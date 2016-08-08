require './lib/atm.rb'

describe Atm do
  it 'has 1000$ when created' do
    expect(subject.funds).to eq 1000
  end

  it { is_expected.to respond_to :withdraw }

  it 'funds are reduced at successful withdraw' do
    subject.withdraw(50)
    expect(subject.funds).to eq 950
  end
end
