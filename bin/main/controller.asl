// Agent controller in project ambulance_system

/* Initial beliefs and rules */

/* Initial goals */

!find_available_ambulance.

/* Plans */

+!find_available_ambulance : coord(X,Y)
<- .print(X,", ",Y); 
store_coord(X,Y);
.broadcast(tell, is_available);
.wait(1000);
!request_help.

+available(X,Y,Name)
<- calculate_diff(Name,X,Y).

+!request_help
<- find_closest.

+closest_ambulance(X) : coord(P,R)
<- .send(X, tell, go_to_event(P,R)); 
.println(X).

+going_to_coordinate(Name)
<- .print(Name," is going to incident").

+getting_the_patient(Name)
<- .print(Name, " is getting patient").

+going_to_hospital(Name)
<- .print(Name, " is going to hospital").

+now_available(Name)
<- .print(Name, " is now available").
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

{ include("$moiseJar/asl/org-obedient.asl") }
