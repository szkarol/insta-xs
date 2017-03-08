require 'rails_helper'

describe Vision do
  it 'instantiate Google Vision client' do
    expect(Vision.client).to be_instance_of(Google::Cloud::Vision::Project)
  end
end
