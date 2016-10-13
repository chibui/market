# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# broadcast prices to update prices in carts.
App.itemsChannel =
  App.cable.subscriptions.create { channel: "ItemsChannel" },
    received: (data) -> $(".store #main").html(data.html)
