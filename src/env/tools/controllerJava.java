// CArtAgO artifact code for project ambulance_system

package tools;

import cartago.*;

import java.util.*;

public class controllerJava extends Artifact {
	HashMap<String,String> ambulances = new HashMap<String,String>();
	int[] event_coord = {0,0};
	void init(int initialValue) {
		defineObsProperty("count", initialValue);
		defineObsProperty("closest_amb", initialValue);
	}
	@OPERATION
	void store_coord(String X, String Y) {
		event_coord[0] = Integer.parseInt(X);
		event_coord[1] = Integer.parseInt(Y);
	}
	@OPERATION
	void calculate_diff(String Name,String CoordX, String CoordY) {
		System.out.println(Name+" , "+CoordX+","+CoordY);
		int[] coord = {Integer.parseInt(CoordX), Integer.parseInt(CoordY)};
		double distance = Math.sqrt(Math.abs(Math.pow(Math.abs(coord[0] - event_coord[0]),2) - Math.pow(Math.abs(coord[1] - event_coord[1]),2)));
		ambulances.put(Name, String.valueOf(distance));
		System.out.println(Name+"->"+ambulances.get(Name));
	}

	@OPERATION
	void find_closest() {
		String name, distance;
		String closest_amb = "amb1";
		double dist = Integer.MAX_VALUE;
		for(Map.Entry<String,String> mapElement: ambulances.entrySet()) {
			name = mapElement.getKey();
			distance = mapElement.getValue();
			if(Double.parseDouble(distance) < dist) {
				dist = Double.parseDouble(distance);
				closest_amb = name;
			}
		}
		ObsProperty prop = getObsProperty("closest_amb");
		prop.updateValue(closest_amb);
		signal("closest_ambulance",closest_amb);
	}
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

