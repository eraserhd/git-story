class StoryStarter

  constructor: (storyFetcher, branchNameMaker) ->
    @storyFetcher = storyFetcher
    @branchNameMaker = branchNameMaker

  run: (options, andThen) ->
    storyUrl = options.parameters[0]
    @storyFetcher.fetch storyUrl, @_thenNameBranch(options, andThen)

  _thenNameBranch: (options, andThen) ->
    (error, story) =>
      branchName = @branchNameMaker.branchNameForStory options, story
      andThen()

module.exports = StoryStarter
