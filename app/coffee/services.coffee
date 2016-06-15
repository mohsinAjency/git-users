'use strict'

### Services ###

app_name = "myApp"
app = angular.module "#{app_name}.services", []

app.service "appService", ()->
  this.currentUserData = {}
  setCurrentUserData = (user)->
    this.currentUserData = user
  getCurrentUser = ()->
    currentUser
  {
    currentUser : this.currentUserData
    setCurrentUser : setCurrentUserData
  }
# Demonstrate how to register services
# In this case it is a simple value service.
app.value 'version', '0.1'
