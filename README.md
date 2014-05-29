pagehook-rails
====================

pagehook-rails is Ruby on Rails plugin integrates [Pagehook](https://github.com/labocho/pagehook).


Installation
--------------------

Add this line to your Rails application's Gemfile:

    gem "pagehook-rails"

And then execute:

    $ bundle
    $ rails g pagehook:install
    # Or `rails g pagehook:install --lang coffee` if you like CoofeeScript

If you use turbolinks, you should load `pagehook_rails` after `turbolinks` in `app/assets/javascripts/application.js`.


View helper
--------------------

`pagehook` view helper method generates "trigger element".

    <%= pagehook("articles/index", id: 123) %>

This generates following HTML.

    <script type="application/json" data-pagehook="articles/index">{"id":123}</script>


Generator
--------------------

`rails g pagehook path/to/view` generates hook definition template.

    $ rails g pagehook articles/index
          create  app/assets/javascripts/pagehook/articles/index.coffee
    $ cat app/assets/javascripts/pagehook/articles/index.coffee
    //= require pagehook_rails
    Pagehook.register("articles/index", function(data) {
        // Your code
    });


You can also do `rails g pagehook path/to/view --lang coffee` to generate .coffee rather than .js.


Contributing
--------------------

1. Fork it ( http://github.com/labocho/pagehook-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

