require 'rails_helper'

describe Repo do
  it 'exists' do
    attributes = {}
    repo = Repo.new(attributes)

    expect(repo).to be_a(Repo)
  end

  it 'Is initialized with attributes' do
    name = "Lee"
    url = "www.example.com"

    attributes = {
      name: name,
      html_url: url
    }
    repo = Repo.new(attributes)

    expect(repo.name).to eq(name)
    expect(repo.url).to eq(url)
  end

end
