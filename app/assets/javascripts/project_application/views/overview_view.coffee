class window.ProjectApplication.OverviewView extends Backbone.View
    
    id: 'overview'
    className: 'section'
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/overview']()
        $(@el).html(template)
        
        @setupAudit()
        
        this
        
    setupAudit: =>
        @updateProgress()
        return unless @project.audit
        
        @project.audit.bind "change:status_id", @updateProgress
        
    updateProgress: =>
        
        # If there's not yet an audit, then we don't care about this
        return unless @project.audit
        
        # If the project is complete, get rid of the progress div
        if @project.audit.get('status_id') == ProjectApplication.Audit.Status.completed
            @$('#progress').remove()
            @progressView = null
            
        else
            # If this is the first time we've been here, create the progress view
            unless @progressView
                @progressView = new ProjectApplication.OverviewProgressView(@project)
                @$('#progress').replaceWith(@progressView.render().el)
                
            # Update the status
            @progressView.updateStatus()