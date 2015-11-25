# open-uri-s3

Usage:

```ruby
require 'open-uri-s3'
```

Reading objects:

```ruby
open('s3://my.bucket/public/hello') # returns AWS::S3::S3Object (quacks like IO)
```

or a safer option (see [this post][open-uri-dangers] on the dangers of using open-uri with user input)

```ruby
URI('s3://my.bucket/public/hello').read
```

Writing objects:

```ruby
open('s3://my.bucket/public/hello', 'w'){|f| f.write 'Hello world!'}
```

## Contributing to open-uri-s3

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Erik Terpstra. See LICENSE.txt for
further details.

[![open-uri-s3 API Documentation](https://www.omniref.com/ruby/gems/open-uri-s3.png)](https://www.omniref.com/ruby/gems/open-uri-s3)
[open-uri-dangers]: http://sakurity.com/blog/2015/02/28/openuri.html
