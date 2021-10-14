Describe('mulberry', function()
  Describe('numbers', function()
    It('can match by positivity and negativity', function()
      Expect(1).To.Be.Positive()
      Expect(0).To.Not.Be.Positive()
      Expect(-1).To.Be.Negative()
    end)

    It('can match by identity', function()
      Expect(0).To.Be.Zero()
    end)

    It('can match by evenness and oddness', function()
      Expect(0).To.Be.Even()
      Expect(1).To.Be.Odd()
      Expect(2).To.Not.Be.Odd()
      Expect('2').To.Not.Be.Even()
    end)

    It('can match by ranges', function()
      Expect(10).To.Be.InRange(0, 100)
      Expect(100).To.Not.Be.InRangeExclusive(0, 100)

      Expect(8).To.Be['>'](7)
      Expect(8).To.Be['<'](10)
      Expect(8).To.Be.Le(8)
      Expect(8).To.Not.Be.GreaterThan(8)
      Expect(8).To.Not.Be['>='](9)
    end)
  end)

  Describe('booleans', function()
    It('can match true and false', function()
      Expect(true).To.Be.True()
      Expect(false).To.Be.False()
      Expect(true).To.Not.Be.False()
      Expect(false).To.Not.Be.True()
    end)
  end)

  Describe('nil', function()
    It('can match nil', function()
      Expect(true).To.Not.Be.Nil()
      Expect(nil).To.Be.Nil()
    end)
  end)

  Describe('strings', function()
    It('can match substrings', function()
      Expect('foo').To.Match 'oo'
      Expect('foo').To.Include 'oo'
      Expect('oo').To.Be.In 'foo'
      Expect('foo').To.Not.Match 'bar'
    end)

    It('can match by regular expression', function()
      Expect('foobarqux()').To.Match(vim.regex [[\w\+()]])
      Expect('foobarqux ()').To.Not.Match(vim.regex [[\w\+()]])
    end)
  end)

  It('supports types', function()
    Expect('foo', 8).To.Be.A.Number()
    Expect('8').To.Be.A.String()
    Expect({}).To.Be.A.Table()
    Expect(8).To.Not.Equal(9)
    Expect(8).To.Be.OfType 'number'
  end)

  It('supports tables', function()
    Expect({ 2, 4, 6, 8 }).To.Be.A.UniformList()
    Expect({ 'a', 'b', 'c' }).To.Be.A.UniformList()

    Expect({ a = 1, b = 2 }).To.Not.Be.A.UniformList()

    Expect(8).To.Be.In { 2, 4, 6, 8 }
    Expect(8).To.Not.Be.In { 1, 3, 5, 7 }

    Expect({ a = 1, b = 2 }).To.Be.A.TypedDict { 'string', 'number' }
    Expect({ a = 1, b = 2 }).To.Be.A.UniformDict()

    Expect({ a = '1', b = '2' }).To.Not.Be.A.TypedDict { 'string', 'number' }
    Expect({ a = 1, b = '2' }).To.Not.Be.A.UniformDict()

    Expect('foo').To.Be.In { foo = 'bar', qux = 'ham' }
    Expect('bar').To.Not.Be.In { foo = 'bar', qux = 'ham' }

    Expect({ 2, 4, 6, 8 }).To.Include(8)
    Expect({ 1, 3, 5, 7 }).To.Not.Include(8)

    Expect({ 1, 3, 5, 7 }).To.Be.A.ListLike()

    Expect({ foo = 'bar', qux = 'ham' }).To.Include 'foo'
    Expect({ foo = 'bar', qux = 'ham' }).To.Not.Include 'bar'

    Expect({ foo = 'bar', qux = 'ham' }).To.Not.Be.A.ListLike()
    Expect({ 1, 2, 3, qux = 'ham' }).To.Not.Be.A.ListLike()
  end)

  It('supports functions', function()
    Expect(function()
      return 'foo'
    end).To.EvaluateTo 'foo'
  end)
end)
