# InSpec test for recipe mongodb::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  
  describe user('root'), :skip do
    it { should exist }
  end
end


describe port(27017), :skip do
  it { should_not be_listening }
end
