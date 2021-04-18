// 1. window onload
window.onload = function() {
	// eventHandlerFunc('onload');

	// 3. on focus and on blur
	var x = document.getElementById("formSection");
	x.addEventListener("focus", onFocus, true);
	x.addEventListener("blur", onblur, true);

	// fetch data on window load
	fetchAllData();
}

// 2. mouse hover on heading (h3)
document.getElementsByClassName("employeeTest")[0].addEventListener("mouseover", mouseOver);
function mouseOver() {
  eventHandlerFunc('mouse hover');
}

onFocus= () => {
  eventHandlerFunc('on focus');
}

onblur = () => {
  eventHandlerFunc('on blur');
}

eventHandlerFunc = (eventName) => {
	storeEventFunc(eventName);
}

onClick = () => {
	let value = $('#eventHolderName').val();
	if (value) {
		eventHandlerFunc(value + '(on click event)');
		$('#formSection').trigger("reset");
		event.preventDefault();
	}
}

// Store event to database
storeEventFunc = (eventName) => {
	let storeData = { eventName : eventName , act : 'store'};
	$.ajax({
		url : 'api/api.php',
		type : 'post',
		data : storeData,
		dataType : 'json',
		success : function(response) {
			if (response.status) {
				fetchAllData();
			}
		},
		error : function(error) {
			// console.log('error ',error);
		},
		complete : function(complete) {
			// console.log('complete ',complete);
		}
	});
}

// fetch data from database
fetchAllData = () => {
	$.ajax({
		url : 'api/api.php',
		type : 'post',
		data : { 'act' : 'list' },
		dataType : 'json',
		success : function(response) {
			if (response.status) {
					let html = '';
	        		for(let i=0; i<response.details.length; i++) {
	        			html += '<tr class="parentTr'+response.details[i]['id']+'">';
	        			html += '<td>'+(i+1)+'</td>';
	        			html += '<td>'+response.details[i]['event_name']+'</td>';
	        			html += '<td><a class="btn btn-danger deleteRec btn-xs" data-id="'+response.details[i]['id']+'">Delete</a></td>';
	        			html += '</tr>';
	        		}
		        	if (html != '') {
		        		$('.eventList').html(html);
		        	}
			}
		},
		error : function(error) {
			// console.log('error ',error);
		},
		complete : function(complete) {
			// console.log('complete ',complete);
		}
	});
}

// delete record from database
$(document.body).on('click', '.deleteRec', function(e) {
	let eventId = $(this).attr('data-id');
	$.ajax({
		url : 'api/api.php',
		type : 'post',
		data : { 'act' : 'delete', 'eventId' : eventId },
		dataType : 'json',
		success : function(response) {
			if (response.status) {
				$('.parentTr'+eventId).remove();
			}
		},
		error : function(error) {
			// console.log('error ',error);
		},
		complete : function(complete) {
			// console.log('complete ',complete);
		}
	});
});