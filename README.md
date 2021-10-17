# Metus

Metus is a highly opinionated business application framework, made to create backend applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metus'
```

And then execute:

```bash
$ bundle
```

## Usage

### Pages

Public, static pages are served by `Metus::PagesController`. Create the directory `app/views/metus/pages` and create HAML templates there. For example, create `app/views/metus/pages/home.html.haml`. Metus generates routes for you. To set your homepage to render `home.html.haml`, use the following route in your `config/routes.rb`:

```ruby
root to: 'metus/pages#home'
```

## Contributing

Contributions are welcome. Please open an issue on Github to discuss a contribution or open a pull request if you are feeling lucky.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
