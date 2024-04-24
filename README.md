# Unified-LMS

Ruby client to integrate multiple learning management systems.
## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

# Usage

### Authenticate
```ruby
# Authenticating with client id and secret

canvas_client = UnifiedLms::Client.new(
    :canvas,
    redirect_uri: "https://example.com",
    client_id: "example_id",
    client_secret: "example_secret",
)
canvas_client.authenticate

# Authenticating directly with token
canvas_client = UnifiedLms::Client.create_client(
    :canvas, 
    token: "token_example"
)
canvas_client.authenticate
```

### Get students
```ruby
canvas_client.get_students(:course_id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/riipen/unified-lms.

## Testing Procedure
### Canvas
To test against a working instance of canvas, set up an Ubuntu system or VM. After that clone the open-souce canvas repository by instructure from github into the directory you want to set it up out of.

`git clone https://github.com/instructure/canvas-lms.git`

Enter the the canvas-lms sourse folder and run `./script/docker_dev_setup.sh`.
follow the instruction given by the commandline and the docker-compose and database.yml files will be automatically setup. 
