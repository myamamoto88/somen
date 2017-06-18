RtmClient  = require('@slack/client').RtmClient
WebClient  = require('@slack/client').WebClient
RTM_EVENTS = require('@slack/client').RTM_EVENTS

class Slack
    set_token: (token) ->
        console.log 'Slack.new', token
        @token = token

    test: (callback) ->
        console.log "test", @token
        client = new WebClient(@token)
        client.api.test callback

    setup: (window) ->
        @slack = new RtmClient @token
        @slack.start()

        @slack.on RTM_EVENTS.MESSAGE, (data) ->
            console.log data
            window.webContents.send 'message', data['text']

module.exports = { Slack: Slack }
