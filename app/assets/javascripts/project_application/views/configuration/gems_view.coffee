class window.ProjectApplication.ConfigurationGemsView extends Backbone.View
    
    id: "gems"
    
    constructor: (@gems) ->
        super()
    
    render: ->
        template = JST['project_application/templates/configuration/gems']()
        $(@el).html(template)
        
        @$tbody = @$('tbody')
        
        @gems.each (gem) =>
            view = new ProjectApplication.ConfigurationGemView(gem)
            @$tbody.append(view.render().el)
            
        this