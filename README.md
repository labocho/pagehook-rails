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
    # Or `rails g pagehook:install --lang js` if you dont use TypeScript


View helper
--------------------

`pagehook` view helper method generates "trigger element".

    <%= pagehook("articles/index", {id: 123}) %>

This generates following HTML.

    <script type="application/json" data-pagehook="articles/index">{"id":123}</script>


Generator
--------------------

`rails g pagehook path/to/view` generates hook definition template.

    $ rails g pagehook articles/index
          create  app/javascript/pagehook/articles/index.ts
    $ cat app/javascript/pagehook/articles/index.ts
    import Pagehook from "pagehook"
    Pagehook.register("articles/index", (data: any) => {
      console.log(data);
    });

You can also do `rails g pagehook path/to/view --lang js` to generate .js rather than .ts.


Contributing
--------------------

1. Fork it ( http://github.com/labocho/pagehook-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

