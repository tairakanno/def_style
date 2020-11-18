import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.content}</p>`;
    const messages = document.getElementById('main-main');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
