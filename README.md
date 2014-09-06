# Warden Token Strategy

## Introduction

This is a simple token authentication strategy for
[Warden](https://github.com/hassox/warden). It's not very secure and I wouldn't
use it long-term in production, but if you want a simple API-like means of
authenticating a user with each request, this is a decent way to do it.

It makes a couple of assumptions on parameter naming and such, but I plan to
eventually include configuration capabilities, such that you can create an
initiailizer or something and override the parameter names with custom ones.

## Setup

Pretty easy if you use bundler:

```ruby
gem "warden-token"
```

Or if you use RubyGems:

    gem install warden-token

Then `require "warden/strategies/token"` in your project code (or your Gemfile)
and add it to the Warden strategies collection as such:

    Warden::Strategies.add(:token, Warden::Strategies::Token)

Now you may authenticate using the strategy name `:token`, but you can change
that part to whatever you'd like.
