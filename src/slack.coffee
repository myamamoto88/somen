RtmClient = require('@slack/client').RtmClient
RTM_EVENTS = require('@slack/client').RTM_EVENTS

class Slack
    constructor: ->
        console.log 'Slack.new'
        token = process.env.SLACK_API_TOKEN || ''
        @slack = new RtmClient token

    setup: (window) ->
        @slack.start()

        @slack.on RTM_EVENTS.MESSAGE, (data) ->
            window.webContents.send 'message', data['text']
            console.log data

module.exports = new Slack()
