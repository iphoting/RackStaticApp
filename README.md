# RackStaticApp

`RackStaticApp` is a tiny, zero-configuration static file server built on top of `rack`. The source is extended from the [`Vienna` gem](https://github.com/kmikael/vienna/), with compatibility fixes for Rack 2 and Bundler 2.
The goal is to place everything in `/public`, add two lines to our `config.ru`
and let `RackStaticApp` take care of the rest.

## Installation

Add this line to your application's Gemfile:

    gem 'rackstaticapp'

And then execute:

    bundle

Or install it yourself, run:

    gem install rackstaticapp

## Usage

Place your static files in `/public`, optionally create `/public/404.html`
and add this to your `config.ru`:

    require 'rackstaticapp'
    run RackStaticApp

You're done. Now you can deploy to `heroku`, `dokku` or any other place that supports rack-based apps. This should also work for most apps built with
[Jekyll](http://jekyllrb.com) or [Middleman](http://middlemanapp.com) as long as
you follow the conventions stated above.

If you absolutely must change the root folder for some reason. You can use e.g.
`run RackStaticApp::Application.new('_site')` instead of `run RackStaticApp`.
