require 'aws-sdk'
require 'open-uri'
require 'uri'

module URI
  class S3 < Generic

    # @return [Aws::S3::Object] S3 object (quacks like IO)
    def open(*args)
      client = Aws::S3::Client.new
      bucket_location = client.get_bucket_location(bucket: self.hostname)
      location_constraint = bucket_location.data.location_constraint

      if !location_constraint.empty?
        client = Aws::S3::Client.new(region: location_constraint)
      end

      path = self.path[1..-1]
      object = client.get_object(bucket: self.hostname, key: path).body

      if block_given?
        yield object
      else
        object
      end
    end

    def read
      open(to_s).read
    end
  end

  @@schemes['S3'] = S3
end
