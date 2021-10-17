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

### Backend Setup

To redirect to the backend's homepage after login, add the following to your `config/routes.rb`:

```ruby
  get :admin_root, to: redirect('/metus/backend/welcome'), status: 302, as: :admin_root
```

### Pages

Public, static pages are served by `Metus::PagesController`. Create the directory `app/views/metus/pages` and create HAML templates there. For example, create `app/views/metus/pages/home.html.haml`. Metus generates routes for you. To set your homepage to render `home.html.haml`, use the following route in your `config/routes.rb`:

```ruby
root to: 'metus/pages#home'
```

### Production

Precompile assets using:

```bash
RAILS_ENV=production bin/rails metus:webpacker:compile
```

## Contributing

Contributions are welcome. Please open an issue on Github to discuss a contribution or open a pull request if you are feeling lucky.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
