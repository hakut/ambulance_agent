// Agent ambulance in project ambulance_system

/* Initial beliefs and rules */

/* Initial goals */



/* Plans */

+is_available: coord(X,Y) & available
<- .my_name(Name); 
.send(controller, tell, available(X,Y,Name) ); 
.print(Name,", ",X,",",Y).

+go_to_event(X,Y)
<- -available;
.my_name(Name);
.send(controller, tell, dealing_event(Name));
!go_to_coordinate;
!get_the_patient(X,Y);
!go_to_hospital;
.send(controller, tell, now_available(Name));
+available.

+!go_to_coordinate
<- .my_name(Name);
.send(controller, tell, going_to_coordinate(Name)).

+!get_the_patient(P,R) : coord(X,Y)
<- .my_name(Name);
-coord;
+coord(P,R);
.send(controller, tell, getting_the_patient(Name)).

+!go_to_hospital : coord(X,Y)
<- .my_name(Name);
.send(controller, tell, going_to_hospital(Name)).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
