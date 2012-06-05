describe "Project", ->
    it "can be initialized", ->
        expect(-> new ProjectApplication.Project()).not.toThrow(new TypeError("undefined is not a function"));
        
    it "saves gems", ->
        project = new ProjectApplication.Project({})
        expect(project.gems.length).toEqual(0)
        
        project.gems.add({})
        project.gems.add({})
        project.gems.add({})
        
        expect(project.gems.length).toEqual(3)