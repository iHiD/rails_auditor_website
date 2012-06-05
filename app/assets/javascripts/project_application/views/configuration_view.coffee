class window.ProjectApplication.ConfigurationView extends Backbone.View
    
    id: 'configuration'
    className: 'section'
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/configuration']()
        $(@el).html(template)
        
        gemsView = new ProjectApplication.ConfigurationGemsView(@project.gems)
        @$('#gems').replaceWith(gemsView.render().el)
        
        this