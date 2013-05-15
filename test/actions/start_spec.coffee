StartAction = require '../../lib/actions/start'
expect = require 'expect.js'

describe 'StartAction', ->

  beforeEach ->
    @start = new StartAction
    @options =
      parameters: ['http://foo.com/bar/baz/1172']

  it 'completes asynchronously', (done) ->
    @start.run @options, ->
      done()
