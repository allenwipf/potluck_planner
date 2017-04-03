window.addEventListener("load", function(){

    document.getElementById("new_item").addEventListener("click", new_item);

    add_items_listener();
});

// Adds eventListeners to all the comment delete images.
function add_items_listener(){

	var item_list = document.getElementsByClassName("remove_item");
    for (var x = 0; x <= item_list.length -1; x++){
    	item_list[x].addEventListener("click", remove_item);
    }
}

// Inserts a table row element into the items table body.
function new_item(e){

	var first_row = document.getElementsByClassName("list_items")[0];
	var potluck_id = document.getElementsByClassName("potluck_id")[0].value;
	// var potluck_id = 1
	first_row.insertAdjacentHTML('afterbegin', new_row_info(potluck_id));

	add_items_listener();
	e.preventDefault();
}

// Creates a new comment row.
// 
// returns a String
function new_row_info(potluck_id){
	var rowid =  Date.now();
	return  "<tr class='item_row'>"+
				"<td><input class='item_name form-control' type='text' placeholder='Item Name' id='item_" + rowid + "_name' name='item[" + rowid + "][name]' value=''></td>"+
				"<td><input class='form-control' type='text' scope='row' placeholder='Category' id='item_" + rowid + "_category' name='item[" + rowid + "][category]' value=''></td>"+
				"<td><input class='form-control' type='text' scope='row' placeholder='12 pack, ect.' id='item_" + rowid + "_amount' name='item[" + rowid + "][amount]' value=''></td>"+
				"<td><input class='form-control' type='text' scope='row' placeholder='No one claimed' id='item_" + rowid + "_claimed_by' name='item[" + rowid + "][claimed_by]' value=''></td>"+
				"<td><span class='glyphicon glyphicon-remove text-danger remove_item' role='button'></span></td>" +
				"<td><input class='item_class collapse' id='item_" + rowid + "_name' name='item[" + rowid + "][potluck_id]' value='" +  potluck_id + "'></td>" +
		    "</tr>"
		  
}


// Changes the name of an item to "delete" and collapses parent to make it invisible.
function remove_item(e){

	this.parentNode.parentNode.getElementsByClassName("item_name")[0].value = 'delete';
	this.parentNode.parentNode.className += " collapse";	
}

