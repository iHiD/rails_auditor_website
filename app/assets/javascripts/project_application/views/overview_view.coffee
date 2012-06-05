class window.ProjectApplication.OverviewView extends Backbone.View
    
    id: 'overview'
    className: 'section'
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/overview']()
        $(@el).html(template)
        
        this