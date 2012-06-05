describe "OverviewViewSpec", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.OverviewView()).not.toThrow(new TypeError("undefined is not a function"))
        
    it "shows #progress if the audit is incomplete", ->
        project = new ProjectApplication.Project()
        project.audit = new ProjectApplication.Audit({status_id: ProjectApplication.Audit.Status.auditing})
        
        view = new ProjectApplication.OverviewView(project)
        view.render()
        view.updateProgress()
        
        expect(view.$('#progress').length).toEqual(1)
        
    it "does not show #progress if the audit is complete", ->
        project = new ProjectApplication.Project()
        project.audit = new ProjectApplication.Audit({status_id: ProjectApplication.Audit.Status.completed})
        
        view = new ProjectApplication.OverviewView(project)
        view.render()
        view.updateProgress()
        
        expect(view.$('#progress').length).toEqual(0)