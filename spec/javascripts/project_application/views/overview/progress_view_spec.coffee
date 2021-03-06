describe "OverviewProgressViewSpec", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.OverviewProgressView()).not.toThrow(new TypeError("undefined is not a function"))
        
    it "should display the correct information for the various statuses", ->
        project = new ProjectApplication.Project()
        project.audit = new ProjectApplication.Audit({status_id: 1})
        
        view = new ProjectApplication.OverviewView(project)
        view.render()
        
        project.audit.set status_id: 1
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        expect(view.$('.status_stage.cloning.queued').length).toEqual(1)
        expect(view.$('.status_stage.parsing.queued').length).toEqual(1)
        expect(view.$('.status_stage.auditing.queued').length).toEqual(1)

        project.audit.set status_id: 2
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        expect(view.$('.status_stage.cloning.processing').length).toEqual(1)
        expect(view.$('.status_stage.parsing.queued').length).toEqual(1)
        expect(view.$('.status_stage.auditing.queued').length).toEqual(1)

        project.audit.set status_id: 3
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        expect(view.$('.status_stage.cloning.completed').length).toEqual(1)
        expect(view.$('.status_stage.parsing.queued').length).toEqual(1)
        expect(view.$('.status_stage.auditing.queued').length).toEqual(1)
        
        project.audit.set status_id: 4
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        expect(view.$('.status_stage.cloning.completed').length).toEqual(1)
        expect(view.$('.status_stage.parsing.processing').length).toEqual(1)
        expect(view.$('.status_stage.auditing.queued').length).toEqual(1)
        
        project.audit.set status_id: 5
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        expect(view.$('.status_stage.cloning.completed').length).toEqual(1)
        expect(view.$('.status_stage.parsing.completed').length).toEqual(1)
        expect(view.$('.status_stage.auditing.queued').length).toEqual(1)
        
        project.audit.set status_id: 6
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        expect(view.$('.status_stage.cloning.completed').length).toEqual(1)
        expect(view.$('.status_stage.parsing.completed').length).toEqual(1)
        expect(view.$('.status_stage.auditing.processing').length).toEqual(1)
        
        project.audit.set status_id: 7
        #expect(view.$('.current_status .status').html()).toEqual("Queued for download")
        #expect(view.$('.status_stage.cloning.completed').length).toEqual(1)
        #expect(view.$('.status_stage.parsing.completed').length).toEqual(1)
        #expect(view.$('.status_stage.auditing.completed').length).toEqual(1)