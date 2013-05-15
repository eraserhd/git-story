StartAction = require '../../lib/actions/start'
expect = require 'expect.js'

describe 'StartAction', ->

  beforeEach ->
    @storyFetcherError = null
    @storyFetcherResult = {}
    @storyFetcherUrl = null
    @storyFetcher =
      fetch: (url, continueWith) =>
        @storyFetcherUrl = url
        continueWith @storyFetcherError, @storyFetcherResult

    @start = new StartAction @storyFetcher
    @options =
      parameters: ['http://foo.com/bar/baz/1172']

  it 'completes asynchronously', (done) ->
    @start.run @options, =>
      done()

  it 'fetches the story information', (done) ->
    @start.run @options, =>
      expect(@storyFetcherUrl).to.be 'http://foo.com/bar/baz/1172'
      done()
