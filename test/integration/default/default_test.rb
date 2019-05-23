# InSpec test for recipe mongodb::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?

  describe service('mongod') do
    it { should be_running }
    it { should be_enabled }
  end
end


describe port(27017), :skip do # listening on mongodb port
  it { should be_listening }
end

describe http('http://localhost', enable_remote_worker: true) do
  its('status') { should cmp 502 } # will not equal to 502 error
end
