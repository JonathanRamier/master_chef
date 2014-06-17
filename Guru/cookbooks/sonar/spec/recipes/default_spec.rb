require_relative '../spec_helper'

describe 'sonar::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  # Write quick specs using `it` blocks with implied subjects
  #it { should do_something('...') }

  # Write full examples using the `expect` syntax
  it 'downloads file from site sonar' do
    expect(chef_run).to create_remote_file_if_missing("/usr/local/sonarqube/")
  end

  it 'unzip package downloaded' do
    expect(chef_run).to 
  end

  it 'create link in folder configuration' do
    expect(chef_run).to
  end

  it 'create link in folder logs' do
    expect(chef_run).to
  end

  it 'create link in folder binary' do
    expect(chef_run).to
  end

  it 'configure sonar file configuration' do
    expect(chef_run).to
  end

  it 'Start the service Sonar' do
    expect(chef_run).to
  end

  #it 'does something' do
  #  expect(chef_run).to do_something('...')
  #end
end
