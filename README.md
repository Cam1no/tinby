# Tinby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tinby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinby

## Usage

First, initialize Tinby::Client with your registered facebook email, your registered facebook password, your facebook url:

```
client = Tinby::Client.new(REGISTERED_FACEBOOK_EMAIL, REGISTERED_FACEBOOK_PASSWORD, FACEBOOK_URL)
```

If you want to get your profile ? like this:
```
client.profile
```

If you want to get recommended users ? like this:
```
client.recommended_users
```
and they return JSON:

```
[{
          "group_matched" => false,
            "distance_mi" => 0,
           "content_hash" => "xxxxxxxxxxxxxxxxx",
         "common_friends" => [],
           "common_likes" => [],
    "common_friend_count" => 0,
      "common_like_count" => 0,
       "connection_count" => 0,
                    "_id" => "xxxxxxxxxxxxxxxxx",
                    "bio" => "xxxxxxxxxxxxxxxxx",
             "birth_date" => "xxxxxxxxxxxxxxxxx",
                   "name" => "xxxxxxxxxxxxxxxxx",
              "ping_time" => "2099-01-01T00:00:00.000Z",
                 "photos" => [
        [0] {
                        "id" => "xxxxxxxxxxxxxxxxx",
                       "url" => "https://xxxxxxxxxxxxxxxxx.jpg",
            "processedFiles" => [
                [0] {
                       "url" => "https://xxxxxxxxxxxxxxxxx.jpg",
                    "height" => 640,
                     "width" => 640
                },
            ],
                  "fileName" => "xxxxxxxxxxxxxxxxx.jpg",
                 "extension" => "jpg"
        }
    ],
                   "jobs" => [],
                "schools" => [],
                 "teaser" => {
        "string" => ""
    },
                "teasers" => [],
                 "gender" => 1,
        "birth_date_info" => "",
               "s_number" => 99999999999999999999999999
}]
```

If you want to like someone ? like this:
```
client.like(user_id)
```

If you want to dislike someone ? like this:
```
client.dislike(user_id)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tinby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tinby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tinby/blob/master/CODE_OF_CONDUCT.md).
