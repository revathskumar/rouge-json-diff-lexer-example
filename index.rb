require "cuba"
require 'cuba/render'
require "cuba/safe"
require "rack/static"
require 'tilt/erubis'

require 'rouge'
require './json_diff.rb'

Cuba.plugin Cuba::Render

Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"

Cuba.plugin Cuba::Safe

Cuba.use Rack::Static, :urls => ["/css"], :root => "public"

text = <<TEXT
{
  "name": "elm-app",
  "version": "1.0.0",
  "description": "",
  "main": "src/index.js",
  "scripts": {
    "dev": "webpack-dev-server"
  },
  "author": "",
  "license": "MIT",
  "dependencies": {},
  "devDependencies": {
    "css-loader": "^0.26.1",
+   "elm-webpack-loader": "^4.2.0",
-   "file-loader": "^0.9.0",
    "style-loader": "^0.13.1",
    "webpack": "^2.2.0",
    "webpack-dev-server": "^2.2.0"
  }
}
TEXT


ruby_text = <<RUBY_TEXT
module Rouge
  module Lexers
    class Diff < RegexLexer
      title 'diff'
      desc 'Lexes unified diffs or patches'

      tag 'diff'
      aliases 'patch', 'udiff'
      filenames '*.diff', '*.patch'
      mimetypes 'text/x-diff', 'text/x-patch'

      def self.analyze_text(text)
+       return 1   if text.start_with?('Index: ')
-       return 1   if text.start_with?('diff ')
        return 0.9 if text.start_with?('--- ')
      end
    end
  end
end
RUBY_TEXT

Cuba.define do
  on get do
    on root do
      json = ::Rouge::Formatters::HTMLLegacy.format(Rouge::Lexers::JSON.new.lex(text))
      diff = ::Rouge::Formatters::HTMLLegacy.format(Rouge::Lexers::Diff.new.lex(text))
      both = ::Rouge::Formatters::HTMLLegacy.format(Rouge::Lexers::JSONDiff.new.lex(text))
      ruby = ::Rouge::Formatters::HTMLLegacy.format(Rouge::Lexers::Ruby.new.lex(ruby_text))
      ruby_diff = ::Rouge::Formatters::HTMLLegacy.format(Rouge::Lexers::RubyDiff.new.lex(ruby_text))

      render("index", json: json, diff: diff, both: both, ruby: ruby, ruby_diff: ruby_diff)
    end
  end
end
