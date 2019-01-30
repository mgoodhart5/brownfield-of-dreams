require 'rails_helper'

describe Repo do
  it 'exists' do
    attributes = {}
    repo = Repo.new(attributes)

    expect(repo).to be_a(Repo)
  end
end
