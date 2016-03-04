# Namespace for all the classes.
#
window.Formify or= {}

# Base class for inputs.
#
window.Formify.Input = class Input

  # Construct a new input.
  #
  # @param [Object] HTML element in JS format
  #
  constructor: (target) ->
    @id = target.id || target.name
    @name = target.name
    @value = target.value
    @type =  target.type
    @checked = target.checked

# Base class for forms.
#
window.Formify.Form = class Form

  # Construct a new form.
  #
  # @param [String] id attribute for the form to keep track
  #
  constructor: (elementId) ->
    @id = elementId
    @$element = $("##{elementId}")
    @fields = @$element.find(":input")
    @_bindInputChangeEvent()
    @_bindSubmitEvent()
    @loadFromLocalStorage()

  # Saves the form to local storage.
  #
  # @example Saves the form
  #   new Formify.Form('localStorageID').saveToLocalStorage()
  #
  saveToLocalStorage: =>
    serializedForm = @_serialize()
    localStorage.setItem(@id, serializedForm)

  # Loads the form data from local storage.
  #
  # @example Loads the form data
  #   new Formify.Form('localStorageID').loadFromLocalStorage()
  #
  loadFromLocalStorage: =>
    formFields = JSON.parse(localStorage.getItem(@id)) || []

    for formField in formFields
      $("##{formField.id}").prop(formField)
      $("[name='#{formField.name}'").val(formField.value)

    undefined

  # Clears the form data from local storage.
  #
  # @example Clears the form data
  #   new Formify.Form('localStorageID').clearLocalStorage()
  #
  clearLocalStorage: =>
    localStorage.removeItem(@id)

  # Binds every input or change for fields on object init.
  #
  _bindInputChangeEvent: =>
    _self = @
    @fields.each ->
      $(this).on 'input change', (e) ->
        _self.clearLocalStorage()
        _self.saveToLocalStorage()

  # Serializes the form
  #
  _serialize: =>
    fields = []
    @fields.each ->
      fields.push(new Input(this))

    JSON.stringify(fields)

  # Bind the submit event to clear the form when submited
  #
  _bindSubmitEvent: =>
    @$element.on 'submit', (event) =>
      @clearLocalStorage()
