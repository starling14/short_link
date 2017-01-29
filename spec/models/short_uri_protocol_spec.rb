require 'rails_helper'

RSpec.describe ShortUriProtocol, type: :model do
  before(:all) do
    @protocol = ShortUriProtocol.create({name: 'http'})
  end

  it { expect(@protocol).to validate_presence_of(:name) }
  it { expect(@protocol).to have_many(:short_uris) }
end