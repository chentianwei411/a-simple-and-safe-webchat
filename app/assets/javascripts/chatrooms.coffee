document.addEventListener 'turbolinks:load', ->
  document.getElementById("new_message").addEventListener 'keypress', (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      url = this.action
      data = new FormData(this)
      Rails.ajax({
        type: "POST"
        url: url
        data: data
        dataType: "json"
        })
