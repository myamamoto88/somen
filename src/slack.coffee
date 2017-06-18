RtmClient  = require('@slack/client').RtmClient
WebClient  = require('@slack/client').WebClient
RTM_EVENTS = require('@slack/client').RTM_EVENTS

class Slack
    getToken: ->
        @token

    setToken: (token) ->
        console.log 'token', token
        @token = token

    getChannel: ->
        @channel

    setChannel: (channel) ->
        console.log 'channel', channel
        @channel = channel

    test: (callback) ->
        console.log "test", @token
        client = new WebClient(@token)
        client.api.test callback

    setup: (window) ->
        @slack = new RtmClient @token
        @slack.start()

        @slack.on RTM_EVENTS.MESSAGE, (data) =>
            return if data.channel != @getChannel()
            window.webContents.send 'message', data.text

module.exports = new Slack
