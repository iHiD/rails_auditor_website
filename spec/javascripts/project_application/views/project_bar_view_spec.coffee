describe "ProjectBarViewSpec", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.ProjectBarView()).not.toThrow(new TypeError("undefined is not a function"))
        
    it "should change selected tab when section changes", ->
        view = new ProjectApplication.ProjectView(new ProjectApplication.Project()).render()
        $('body').append(view.el)
        expect(view.$('#project_bar .tabs .overview.selected').length).toEqual(1)
        expect(view.$('#project_bar .tabs .configuration.selected').length).toEqual(0)
        
        view.showSection('configuration')
        expect(view.$('#project_bar .tabs .overview.selected').length).toEqual(0)
        expect(view.$('#project_bar .tabs .configuration.selected').length).toEqual(1)
        $(view.el).remove()
        
        
    ### 
    it "should only show one tab if the project is not audited", ->
        view = new ProjectApplication.ProjectBarView(new ProjectApplication.Project({})).render()
        expect($(view.el).find('.tabs .overview').length).toEqual(0)
        expect($(view.el).find('.tabs .configuration').length).toEqual(0)
        expect($(view.el).find('.tabs .visualisations').length).toEqual(0)
        expect($(view.el).find('.tabs .issues').length).toEqual(0)
               
    it "should show configuration tab if there is an audit", ->
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit())
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .overview').length).toEqual(1)
                
    it "should only show configuration tab if the project has been parsed", ->
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit(status_id: 1))
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .configuration').length).toEqual(0)
        
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit(status_id: 3))
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .configuration').length).toEqual(1)
                
    it "should only show visualisation tab if the project has been parsed", ->
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit(status_id: 1))
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .visualisation').length).toEqual(0)
        
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit(status_id: 3))
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .visualisation').length).toEqual(1)
                
    it "should only show issues tab if the project has been audited", ->
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit(status_id: 1))
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .issues').length).toEqual(0)
        
        project = new ProjectApplication.Project(audit: new ProjectApplication.Audit(status_id: 5))
        view = new ProjectApplication.ProjectBarView(project).render()
        expect($(view.el).find('.tabs .issues').length).toEqual(1)
    ###