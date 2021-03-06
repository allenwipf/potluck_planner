window.addEventListener('turbolinks:load', function(){

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
	var potluck_id = document.getElementById("p_id").value;
	first_row.insertAdjacentHTML('afterbegin', new_row_info(potluck_id));

	add_items_listener();
	// e.preventDefault();
}

// Creates a new comment row.
// 
// Returns a String.
function new_row_info(potluck_id){
	var rowid =  Date.now();
	return  "<tr class='item_row'>"+
				"<td><input class='item_name form-control' type='text' placeholder='item Name' id='item_" + rowid + "_name' name='item[" + rowid + "][name]' value=''></td>"+
				"<td><input class='form-control' type='text' scope='row' placeholder='Category' id='item_" + rowid + "_category' name='item[" + rowid + "][category]' value=''></td>"+
				"<td><input class='form-control' type='text' scope='row' placeholder='12 pack, ect.' id='item_" + rowid + "_amount' name='item[" + rowid + "][amount]' value=''></td>"+
				"<td><input class='form-control' type='text' scope='row' placeholder='no one claimed' id='item_" + rowid + "_claimed_by' name='item[" + rowid + "][claimed_by]' value=''></td>"+
				"<td class='nopadding'><input class='collapse delete_row' type='text' name='row_" + rowid + "[delete]' value='0'>"+
				"<span class='glyphicon glyphicon-remove text-danger remove_item' role='button'></span>" +
				"<input class='item_class collapse' id='item_" + rowid + "_name' name='item[" + rowid + "][potluck_id]' value='" +  potluck_id + "'></td>" +
		    "</tr>"	  
}


// Changes the name of an item to "delete" and collapses parent to make it invisible.
function remove_item(e){

	this.parentNode.parentNode.getElementsByClassName("delete_row")[0].value = '1';
	this.parentNode.parentNode.className += " collapse";	
}





