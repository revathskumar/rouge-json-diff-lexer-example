module Rouge
  module Lexers
    load_lexer 'json.rb'
    load_lexer 'ruby.rb'

    class JSONDiff < JSON
      prepend :root do
        rule(/^\+.*$\n?/, Generic::Inserted)
        rule(/^-+.*$\n?/, Generic::Deleted)
        rule(/^!.*$\n?/, Generic::Strong)
        rule(/^@.*$\n?/, Generic::Subheading)
        rule(/^([Ii]ndex|diff).*$\n?/, Generic::Heading)
        rule(/^=.*$\n?/, Generic::Heading)
      end
    end

    class RubyDiff < Ruby
      prepend :root do
        rule(/^\+.*$\n?/, Generic::Inserted)
        rule(/^-+.*$\n?/, Generic::Deleted)
        rule(/^!.*$\n?/, Generic::Strong)
        rule(/^@.*$\n?/, Generic::Subheading)
        rule(/^([Ii]ndex|diff).*$\n?/, Generic::Heading)
        rule(/^=.*$\n?/, Generic::Heading)
      end
    end
  end
end
