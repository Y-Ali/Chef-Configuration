
# InSpec test for recipe mongodb::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service "mongod" do
it { should be_running }
it { should be_enabled }
end

describe port(27017) do
it { should be_listening }
end
