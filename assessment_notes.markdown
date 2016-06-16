#Notes from Assessment with Jhun:

* it’s working! it’s awesome! love the functionality
* bug with refresh in cart: feature works, but affects usability

###Views:

* retired items: a bit of logic in view, could be extracted into a view helper; view helper would return the button; this is small

could clean up the partials in the users views folder for edit and new

* also an if else in the orders show, but logic minimal

###Controllers:

* scope orders controller to current user with before action
* nested if in sessions controller; could pull out nested if into another method called login_redirect
* what i’m seeing is good, inching towards excellent; we recognize the places that could be better
* code looks generally pretty good

###Models:

* likes our methods that get logic out of the views
* strong effort to keep logic out of other layers, goes hand in hand with the controller
* have the potential to be a 4

###Tests:

* trend towards calling item.price instead of “5.99” in test; this will help you avoid having to change tests if that value changes
* nice user of stubbing in feature tests
* nice scoping in feature tests; consistent pattern of scoping
* could make spec helper methods for setup pieces that will be reused, esp for those longer pieces  eg visitor can create new account spec

###Usability:

* needs some polish; i.e. refresh for updating quantity in cart

###Workflow:

* some hound commits leaked through rebase
* likes our comments and conversation on code review for PRs
