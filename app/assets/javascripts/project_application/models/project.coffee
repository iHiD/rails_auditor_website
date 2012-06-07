class window.ProjectApplication.Project extends Backbone.Model
    
    constructor: (data) ->
        super(data)
        @_audit = null
        
    setAudit: (audit) ->
        
        @audit = audit
        PrivatePub.subscribe "/audits/#{@audit.id}", (data, channel) =>
            console.log data
            @audit.set(data.audit) if data.audit
            @audit.gems.add(data.audit_gem) if data.audit_gem
            