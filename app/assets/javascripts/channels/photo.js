App.photo = App.cable.subscriptions.create("PhotoChannel", {
  received: function(data) {
    switch (data['action']) {
      case 'create':
        $('#photos-list').prepend(data.photo);
        break;
      case 'delete':
        $("[data-photo-id='" + data.photo_id + "']").remove()
        break;
    }
  },
  create: function(photo) {
    this.perform('create', {
      photo: photo
    });
  },
  delete: function(photo) {
    this.perform('delete', {
      photo: photo
    });
  }
});
