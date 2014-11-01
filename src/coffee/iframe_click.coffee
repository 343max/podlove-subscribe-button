$ = require('../../vendor/zepto-browserify.js').Zepto
_ = require('../../vendor/underscore-min.js')

class IframeClick
  @listen: (iframe, callback, options) ->
    id = options.id
    window.podloveSubscribeButtonStoredOptions ?= {}
    window.podloveSubscribeButtonStoredOptions[id] = _.clone(options)

    window.addEventListener('message', ((event) =>

      return unless event.data == "clicked_#{id}"

      options = window.podloveSubscribeButtonStoredOptions[id]
      callback(options)
    ), false)

module.exports = IframeClick
