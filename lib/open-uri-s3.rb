module URI
  class S3 < Generic
    # @return [AWS::S3::S3Object] S3 object (quacks like IO)
    def open(*args)
      s3 = AWS::S3.new
      bucket = s3.buckets[self.hostname]
      if bucket.location_constraint
        s3 = AWS::S3.new(s3_endpoint: "s3-#{bucket.location_constraint}.amazonaws.com")
        bucket = s3.buckets[self.hostname]
      end

      path = self.path[1..-1]
      object = bucket.objects[path]

      if args[0] == 'w'
        yield object
      end

      object
    end
  end

  @@schemes['S3'] = S3
end
