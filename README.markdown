# Janrain Engage Demo

This is a Rails app that demonstrates using [rpx_now](http://github.com/grosser/rpx_now)
to add [Janrain Engage](http://www.janrain.com/products/engage) (formerly RPX) to your Rails app.
Janrain Engage allows your visitors to login to your website with their existing accounts on Facebook,
Google, Twitter, Yahoo!, LinkedIn, Windows Live, MySpace, AOL or other networks and then gather their
profile data and publish their activities from your website to multiple social networks.

![Janrain Engage Popup](/blob/master/public/images/janrain-engage-popup.png "Janrain Engage Popup")

## Features

- A user can login using a popup or embedded widget
- `current_user` represents the currently logged in user 
- You can use `before_filter :require_user` to protect restricted actions
- A request to a restricted action redirects to a login page with embedded widget
- Once logged in, a new user is redirected to edit profile data that is auto-filled
- Once logged in, a returning user is redirected to the requested action
- An invalid user (with duplicate username, missing email, etc.) can't access any restricted action before fixing her data

## Try it

1. `git clone git://github.com/hatem/janrain-engage-demo.git`
2. `cd janrain-engage-demo`
3. Install required gems: `rake gems:install`
4. Run the app and try the widget: `script/server`

## Use it

1. Login to janrain.com and create a new application
2. Replace the value of `RPXNow.api_key` in `/config/environment.rb` with the API Key of your Janrain application
3. Replace `janrain-engage-demo` in `RPXNow.popup_code()` and `RPXNow.embed_code()` with the name of your Janrain application 
4. In the "Sign-in" section of your Janrain dashboard, you can choose the providers you want to be included in the widget. A wizard will guide you if a provider needs some configuration.
Note: a Facebook application needs "Connect URL" which looks like this: https://janrain-engage-demo.rpxnow.com/