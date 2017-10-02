function input_check( e, check_for ){
	e.preventDefault();
	var val = e.target.value;
	switch (check_for) {
		case 'username':
			val = val.replace(/[^a-z0-9_]/gi,'');
		break;
		case 'name':
			val = val.replace(/[^a-z\s]/gi,'');
		break;
		case 'number':
			val = val.replace(/[^\d+]/gi,'');
		break;
	}
	e.target.value = val; 
}