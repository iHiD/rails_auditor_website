class window.ProjectApplication.ConfigurationGemView extends Backbone.View
    
    className: "gem"
    tagName: "tr"
    
    constructor: (@gem) ->
        super()
    
    render: ->
        template = JST['project_application/templates/configuration/gem']( gem: @gem.toJSON() )
        $(@el).html(template)
        
        this