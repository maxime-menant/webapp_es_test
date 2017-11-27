[![Build Status](https://travis-ci.org/maxime-menant/webapp_es_test.svg?branch=master)](https://travis-ci.org/maxime-menant/webapp_es_test)

# Ruby on Rails and Elasticsearch: Example application

This application is an example of integrating the {Elasticsearch}[http://www.elasticsearch.org]
search engine with the {Ruby On Rails}[http://rubyonrails.org] web framework.

It has been generated by application templates available at
https://github.com/elasticsearch/elasticsearch-rails/tree/master/elasticsearch-rails/lib/rails/templates.

## [1] Basic

The `basic` version provides a simple integration for a simple Rails model, `Article`, showing how
to include the search engine support in your model, automatically index changes to records,
and use a form to perform simple search require 'requests.'


## [2] Pretty

The `pretty` template builds on the `basic` version and brings couple of improvements:

* Using the [Bootstrap](http://getbootstrap.com) framework to enhance the visual style of the application
* Using an `Article.search` class method to customize the default search definition
* Highlighting matching phrases in search results
* Paginating results with Kaminari

