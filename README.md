## Rouge Diff with other language (JSON/RUBY) example

  > Custom Diff lexer which show diff along with JSON/Ruby syntax highlighting.

## Demo

* Install dependencies

```
bundle
```

* Start the server

```
rackup config.ru
```

## Screenshots

![diff](images/diff.png) | ![ruby](images/ruby.png)  | ![ruby-diff](images/ruby-diff.png)
---|---|---
Diff Lexer | Ruby Lexer  | RubyDiff custom lexer 

## Try a different theme

Get the list of themes from [rouge/lib/rouge/themes](https://github.com/jneen/rouge/tree/ec665bb2ccac767874e85c5b9d6fdefbf471058e/lib/rouge/themes) and generate theme via command

```
rougify style <theme> > public/css/style.css
```

## License

[MIT](https://revathskumar.mit-license.org/)

```
The MIT License (MIT)
Copyright © 2017 Revath S Kumar

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
