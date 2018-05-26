/*$(document).ready(function(){
   refreshForm();
});
function refreshForm(){
   $("input").each(function(){
      var number = parseInt($(this).val()) + 1;
         $(this).val(number);
    });
    setTimeout(refreshForm, 5000);
}*/

/*window.onload=function(){
	if(typeof jQuery == 'undefined'){
	    window.alert("no jquery");
	}
	else{
		window.alert("jquery");
	}
}*/

function changeValue(e){
	var id=$(e).attr("id");
	//var unit = document.getElementById("unit");
	var amount = document.getElementById(id);
	//var subTotal = document.getElementById("subTotal");
	var shoppingCart={};
	shoppingCart.id=id;
	shoppingCart.quantity=amount.value;
	//shoppingCart.quantity=amount.value;
	//subTotal.textContent = parseFloat(amount.value) *parseFloat(unit.textContent)
	$.ajax({  
        url : "/customer/cartList/test",  
        type : 'POST', 
        dataType: 'JSON',
        data : JSON.stringify(shoppingCart),
        cache: false,
        processData: false,
        contentType: 'application/json', 
        success : function(responseStr) {  
            location.reload(true);  
        },  
        error : function(responseStr) {  
        	location.reload(true);  
        }  
    });
}

/*$(function() {
	alert($('#form').serialize());
	syn();
	setInterval(syn,10000);
});*/

/*function syn(){
	/*$.get("/cunstomer/cartList/test", function(data){
		/*data = JSON.parse(data);
		alert(data);
		$("tbody").empty();
		$.each(data,function(index,value){
			var trHTML = "<tr>"
				+"<td><a href='ProductManagmentController?action=edit&id="+value.id+"'>Update</a></td>"
				+"<td><a href='ProductManagmentController?action=delete&id="+value.id+"'>Delete</a></td>"
				+"<td>"+value.id+"</td>"
				+"<td>"+value.name+"</td>"
				+"<td>"+value.price+"</td>"
				+"<td>"+value.catagory+"</td>"
				+"<td>"+value.inventorynum+"</td>"
				+"<td>"+value.link+"</td>"
				+"<td>"+value.discription
				"</td></tr>";
			$("tbody").append(trHTML);
		});
	}, "text");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "/cunstomer/cartList/test" ,
		data: $('#form').serialize(),
		success: function () {},
        error : function() {}
	});
}*/

/*$("input").change(function(){
	$.ajax({  
        url : "/cunstomer/cartList/test",  
        type : 'GET', 
        dataType: 'json',
        //data : formdata,  
        cache: false,
        processData: false,
        contentType: false, 
        success : function(responseStr) {  
            alert("succeed");    
        },  
        error : function(responseStr) {  
            alert("fail");
        }  
    }); 
});*/