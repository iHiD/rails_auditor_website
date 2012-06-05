class window.ProjectApplication.OverviewProgressView extends Backbone.View
    
    id: 'progress'
    
    constructor: (@project) ->
        super()
    
    render: ->
        template = JST['project_application/templates/overview/progress']()
        $(@el).html(template)
        
        @$status = @$('.current_status .status')
        @$statusStageCloning = @$('.status_stage.cloning')
        @$statusStageParsing = @$('.status_stage.parsing')
        @$statusStageAuditing = @$('.status_stage.auditing')
        
        this
        
    updateStatus: ->
        switch @project.audit.get('status_id')
            when ProjectApplication.Audit.Status.queued_for_cloning
                @$status.html("Queued for download.")
                @$statusStageCloning.addClass('queued')
                @$statusStageParsing.addClass('queued')
                @$statusStageAuditing.addClass('queued')
                
            when ProjectApplication.Audit.Status.cloning
                @$status.html("Downloading Repository.")
                @$statusStageCloning.addClass('processing')
                @$statusStageParsing.addClass('queued')
                @$statusStageAuditing.addClass('queued')
                
            when ProjectApplication.Audit.Status.queued_for_parsing
                @$status.html("Repository downloaded. Now queued for parsing.")
                @$statusStageCloning.addClass('completed')
                @$statusStageParsing.addClass('queued')
                @$statusStageAuditing.addClass('queued')
                
            when ProjectApplication.Audit.Status.parsing
                @$status.html("Parsing repository.")
                @$statusStageCloning.addClass('completed')
                @$statusStageParsing.addClass('processing')
                @$statusStageAuditing.addClass('queued')
                
            when ProjectApplication.Audit.Status.queued_for_auditing
                @$status.html("Parsing completed. Now queued for auditing.")
                @$statusStageCloning.addClass('completed')
                @$statusStageParsing.addClass('completed')
                @$statusStageAuditing.addClass('queued')
                
            when ProjectApplication.Audit.Status.auditing
                @$status.html("Auditing your application.")
                @$statusStageCloning.addClass('completed')
                @$statusStageParsing.addClass('completed')
                @$statusStageAuditing.addClass('processing')
                
            when ProjectApplication.Audit.Status.auditing
                @$status.html("Audit Completed.")
                @$statusStageCloning.addClass('completed')
                @$statusStageParsing.addClass('completed')
                @$statusStageAuditing.addClass('completed')