require 'rails_helper'
require 'short_uri_generator'

RSpec.describe ShortUriGenerator do
  it 'return string by integer' do
    str = ShortUriGenerator.encode(567788)
    expect(str).to be_kind_of(String)
  end

  it 'decoded string to integer' do
    str = ShortUriGenerator.encode(567788)
    id = ShortUriGenerator.decode(str)
    expect(id).to eq(567788)
  end

  it 'return specific length string' do
    start_id = 1
    string_expected_length = 4
    offset = ShortUriGenerator.id_offset(string_expected_length)

    str = ShortUriGenerator.encode(start_id + offset)

    expect(str.length).to eq(string_expected_length)
  end
end