$(() => {
  // get connected rooms once connected. Buried hooker in top_nav_bar
  const roomIds = $('.all_subscribed_rooms_id').data('id');
  window.rooms = [];
  // connect with each room
  roomIds.forEach((ele) => {
    console.log('FOREACH GOT EXECUTED!!!');
    window.rooms[ele] = App.cable.subscriptions.create ({
      channel: 'RoomsChannel',
      room_id: ele
    }, {
      connected: function () {
        console.log(`Woooo, I am connected with Room ${ele}!`);
      },
      disconnected: function () {
        console.log(`Damn it, I am disconnected with Room ${ele}...`);
      },
      received: function(data) {
        // receive data, judge if the data should be appende into this room
        if(data.room_id === Number(location.pathname.split('').pop())) {
          $('#messages').append(`<div>${data.content}<div>`);
        }
      }
    });
  });
});

// remember to use turbolinks:load to make jquery effective
// add event listener to be ready to send out message
$(document).on('turbolinks:load', () => {
  $('#message-input').focus().on('keydown', function(event) {
    const $this = $(this);
    if (event.keyCode === 13) {
      const content = event.target.value;
      const chatroomId = $this.data('roomId');
      const userId = $this.data('userId');
      window.rooms[chatroomId].send({content: content, room_id: chatroomId, user_id: userId});
      $this.val("");
    }
  });
});
