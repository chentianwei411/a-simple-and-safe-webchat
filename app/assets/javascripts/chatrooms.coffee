document.addEventListener 'turbolinks:load', ->
  document.getElementById("new_message").addEventListener 'keypress', (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      this.submit()
