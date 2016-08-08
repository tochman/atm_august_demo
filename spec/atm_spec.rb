require './lib/atm.rb'

describe Atm do
  let(:account) { double('Account') }

  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'has 1000$ when created' do
    expect(subject.funds).to eq 1000
  end

  it { is_expected.to respond_to :withdraw }

  it 'funds are reduced at successful withdraw' do
    subject.withdraw(account,   50)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if account has funds' do
    expected_output = { status: true,
                        message: 'success',
                        date: Date.today,
                        amount: 45 }

    expect(subject.withdraw(account, 45)).to eq expected_output
  end
end
