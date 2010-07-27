require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe GeneratorFromDiffGenerator do

  it "should have three required arguments" do
    begin
      GeneratorFromDiffGenerator.new([])
    rescue Thor::RequiredArgumentMissingError => e
      e.message.should == "No value provided for required arguments 'name', 'baseline_revision', 'change_revision'"
    end
  end

  it "should call git diff when valid arguments are provided" do
    gen = GeneratorFromDiffGenerator.new([ 'name', 'HEAD~1', 'HEAD'])
    gen.should_receive(:run).with("git diff --no-prefix HEAD~1 HEAD").and_return('the diff')
    gen.create_patch
  end
end
