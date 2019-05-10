require 'rails_helper'

RSpec.describe "As a visitor, " do
  describe "when I visit '/astronauts'" do
    before :each do
      @mission_1 = Mission.create!(title: "Mission 1", time_in_space: 1)
      @mission_2 = Mission.create!(title: "Mission 2", time_in_space: 2)

      @astronaut_1 = Astronaut.create!(name: "Astronaut 1", age: 31, job: "Job 1")
      @astronaut_2 = Astronaut.create!(name: "Astronaut 2", age: 32, job: "Job 2")
      @astronaut_3 = Astronaut.create!(name: "Astronaut 3", age: 33, job: "Job 3")

      AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_1)
      AstronautMission.create!(astronaut: @astronaut_2, mission: @mission_1)
      AstronautMission.create!(astronaut: @astronaut_3, mission: @mission_1)

      AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_2)
      AstronautMission.create!(astronaut: @astronaut_2, mission: @mission_2)
    end
    it "I see a list of astronauts and their attributes" do

      visit astronauts_path

      within "#astronauts-index-#{@astronaut_1.id}" do
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_1.job)
      end

      within "#astronauts-index-#{@astronaut_2.id}" do
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.age)
        expect(page).to have_content(@astronaut_2.job)
      end

      within "#astronauts-index-#{@astronaut_3.id}" do
        expect(page).to have_content(@astronaut_3.name)
        expect(page).to have_content(@astronaut_3.age)
        expect(page).to have_content(@astronaut_3.job)
      end
    end
  end
end
