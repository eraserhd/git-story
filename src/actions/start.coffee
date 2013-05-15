
class StartAction

  constructor: (storyFetcher) ->
    @storyFetcher = storyFetcher

  run: (options, continueWith) ->
    @storyFetcher.fetch options.parameters[0], (error, story) ->
      continueWith()

module.exports = StartAction
