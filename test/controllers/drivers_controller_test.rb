require "test_helper"

describe DriversController do
  # Note: If any of these tests have names that conflict with either the requirements or your team's decisions, feel empowered to change the test names. For example, if a given test name says "responds with 404" but your team's decision is to respond with redirect, please change the test name.
  let (:driver) {
  Driver.create name: "Minnie Maust", vin: "87932", status: nil}


  describe "index" do
    it "responds with success to view a list of drivers" do
      # Arrange
      # Ensure that there is at least one Driver saved
      get drivers_path
      must_respond_with :success
    end

    it "responds with success when there are no drivers saved" do
      # Arrange
      # Ensure that there are zero drivers saved
      get drivers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "responds with success when showing an existing valid driver" do

      get driver_path(@driver.id)
      must_respond_with :success
    end 
      
    #I changed this from 404 to redirect, because it feels more user friendly
    it "responds with redirect with an invalid driver id" do
      get driver_path(-1)
      must_respond_with :redirect
    end
  end 

  describe "new" do
    
    it "responds with success" do
      get new_driver_path
      must_respond_with :success  
    end
  end

  describe "create" do
    it "can create a new driver with valid information accurately, and redirect" do
      
      driver_hash = {
      driver: {
      name: "Alfred Portlesnape",
      vin: "17245",
      status: false,
        },
      }

      expect {post drivers_path, params: driver_hash}.must_change "Driver.count", 1

      new_driver = Driver.find_by(name: driver_hash[:driver][:name])
      expect(new_driver.vin).must_equal driver_hash[:driver][:vin]


      must_respond_with :redirect
      must_redirect_to drivers_path(driver.id)
    end

    # Act-Assert
    # Ensure that there is a change of 1 in Driver.count

    # Assert
    # Find the newly created Driver, and check that all its attributes match what was given in the form data
    # Check that the controller redirected the user



    it "does not create a driver if the form data violates Driver validations, and responds with a redirect" do
      driver_hash = {
      driver: {
      name:"",
        vin:"17245"
      },
      }

      expect {
      post drivers_path, params: driver_hash
      }.wont_change "Driver.count"


      must_respond_with :redirect
      must_redirect_to driver_path(driver.id)
    end


    describe "edit" do
      it "responds with success when getting the edit page for an existing, valid driver" do
        # Arrange
        # Ensure there is an existing driver saved
        
        # Act
        
        # Assert
        
      end
      
      it "responds with redirect when getting the edit page for a non-existing driver" do
        # Arrange
        # Ensure there is an invalid id that points to no driver
        
        # Act
        
        # Assert
        
      end
    end

    describe "update" do
      it "can update an existing driver with valid information accurately, and redirect" do
        # Arrange
        # Ensure there is an existing driver saved
        # Assign the existing driver's id to a local variable
        # Set up the form data
        
        # Act-Assert
        # Ensure that there is no change in Driver.count
        
        # Assert
        # Use the local variable of an existing driver's id to find the driver again, and check that its attributes are updated
        # Check that the controller redirected the user
        
      end
      
      it "does not update any driver if given an invalid id, and responds with a 404" do
        # Arrange
        # Ensure there is an invalid id that points to no driver
        # Set up the form data
        
        # Act-Assert
        # Ensure that there is no change in Driver.count
        
        # Assert
        # Check that the controller gave back a 404
        
      end
      
      it "does not create a driver if the form data violates Driver validations, and responds with a redirect" do
        # Note: This will not pass until ActiveRecord Validations lesson
        # Arrange
        # Ensure there is an existing driver saved
        # Assign the existing driver's id to a local variable
        # Set up the form data so that it violates Driver validations
        
        # Act-Assert
        # Ensure that there is no change in Driver.count
        
        # Assert
        # Check that the controller redirects
        
      end
    end

    describe "destroy" do
      it "destroys the driver instance in db when driver exists, then redirects" do
        # Arrange
        # Ensure there is an existing driver saved
        
        # Act-Assert
        # Ensure that there is a change of -1 in Driver.count
        
        # Assert
        # Check that the controller redirects
        
      end
      
      it "does not change the db when the driver does not exist, then responds with " do
        # Arrange
        # Ensure there is an invalid id that points to no driver
        
        # Act-Assert
        # Ensure that there is no change in Driver.count
        
        # Assert
        # Check that the controller responds or redirects with whatever your group decides
        
      end
    end
  end
end 
