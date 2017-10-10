$(document).on 'ready', ->
  messages = $('#messages-list')
  App.messages = App.cable.subscriptions.create {
      channel: "RoomChannel"
      conversation_id: messages.data('conversation-id')
    },

    connected: ->
      # Called when the subscription is ready for use on the server
      console.log 'test room.coffee'

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log data
      unless data.content.blank?
        message_template = "
          <li>
            <div class='row'>
              <div class='#{if $('#messages-list').data('current-user-id') == data.user_id then 'message-sent' else 'message-received'}'>
                #{data.content}
              </div>
            </div>
          </li>
        "
        $('#messages-list > ul').append message_template
        scroll_bottom()

$(document).on 'ready', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#send_message').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages-list').scrollTop($('#messages-list')[0].scrollHeight)
