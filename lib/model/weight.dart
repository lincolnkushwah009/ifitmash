
class Weight {

	int _id;
	String _weight;
	// String _description;
	// String _date;

	Weight(this._weight);

	Weight.withId(this._weight,);

	int get id => _id;

	// String get title => _title;

	// String get description => _description;

	String get weight => _weight;


	set weight(String newWeight) {
		if (newWeight.length <= 255) {
			this._weight = newWeight;
		}
	}
	// set description(String newDescription) {
	// 	if (newDescription.length <= 255) {
	// 		this._description = newDescription;
	// 	}
	// }

	// set date(String newDate) {
	// 	this._date = newDate;
	// }

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		// map['title'] = _title;
		// map['description'] = _description;
		map['weight'] = _weight;

		return map;
	}

	// Extract a Note object from a Map object
	Weight.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		// this._title = map['title'];
		// this._description = map['description'];
		this._weight = map['weight'];
	}
}









