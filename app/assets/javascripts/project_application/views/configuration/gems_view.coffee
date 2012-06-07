class window.ProjectApplication.ConfigurationGemsView extends Backbone.View
    
    id: "gems"
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/configuration/gems']()
        $(@el).html(template)
        
        @$tbody = @$('tbody')
        
        @project.audit.gems.bind "reset", =>
            @project.audit.gems.each @renderGem
            
        @project.audit.gems.bind "add", @renderGem
            
        this
        
    renderGem: (gem) =>
        view = new ProjectApplication.ConfigurationGemView(gem)
        @$tbody.append(view.render().el)