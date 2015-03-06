require 'open-uri-s3'

describe URI::S3 do

  let(:uri) { 's3://some-bucket/key/to/object'}
  let(:s3) { instance_double('S3', buckets: buckets) }
  let(:buckets) { {'some-bucket' => bucket} }
  let(:bucket) { double("bucket", objects: objects, location_constraint: false) }
  let(:objects) { {'key/to/object' => object} }
  let(:object) { double('object', read: 'contents') }

  before do
    allow(AWS::S3).to receive(:new).and_return(s3)
  end

  describe "#read" do
    it "reads the object" do
      expect(URI(uri).read).to eq 'contents'
    end
  end
end
