describe "GemsViewSpec", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.ConfigurationGemsView()).not.toThrow(new TypeError("undefined is not a function"))
        
    it "renders gems", ->
        project = new ProjectApplication.Project()
        project.gems.add new ProjectApplication.Gem()
        project.gems.add new ProjectApplication.Gem()
        
        view = new ProjectApplication.ConfigurationGemsView(project.gems)
        view.render()
        console.log view.el
        expect($(view.el).find('tbody tr').length).toEqual(2)