StoryStarter = require '../../lib/git-story/actions/start'
expect = require 'expect.js'

describe 'StoryStarter', ->

  beforeEach ->
    @story =
      name: "Herp the derp frobber"
    @storyFetcherUrl = null
    @storyFetcher =
      fetch: (url, continueWith) =>
        @storyFetcherUrl = url
        continueWith null, @story

    @branchNameMakerReceivedOptions = null
    @branchNameMakerReceivedStory = null
    @branchNameMaker =
      branchNameForStory: (options, story) =>
        @branchNameMakerReceivedOptions = options
        @branchNameMakerReceivedStory = story
        null

    @start = new StoryStarter @storyFetcher, @branchNameMaker
    @options =
      parameters: ['http://foo.com/bar/baz/1172']

  it 'completes asynchronously', (done) ->
    @start.run @options, =>
      done()

  it 'fetches the story information', (done) ->
    @start.run @options, =>
      expect(@storyFetcherUrl).to.be 'http://foo.com/bar/baz/1172'
      done()

  it 'figures out the branch name from the story name', (done) ->
    @story =
      name: 'Branch test'
    @start.run @options, =>
      expect(@branchNameMakerReceivedOptions).to.be.eql @options
      expect(@branchNameMakerReceivedStory).to.be.eql @story
      done()
