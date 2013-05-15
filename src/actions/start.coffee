class StoryStarter

  constructor: (storyFetcher, branchNameMaker) ->
    @storyFetcher = storyFetcher
    @branchNameMaker = branchNameMaker

  run: (options, continueWith) ->
    @storyFetcher.fetch options.parameters[0], (error, story) =>
      branchName = @branchNameMaker.branchNameForStory options, story
      continueWith()

module.exports = StoryStarter
