function arrayCompare(a, b) {
	if (a.length === b.length) { 
		for (var i = 0; i < a.length; i++) {
			if (a[i] !== b[i]) { 
				return false;
			}
		}
		return true;
	}
	return false;
}