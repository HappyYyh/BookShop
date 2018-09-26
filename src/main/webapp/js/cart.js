function fmoney(s, n) {   
   n = n > 0 && n <= 20 ? n : 2;   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   r = s.split(".")[1];   
   t = "";   
   for(i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("") + "." + r;   
}

function addCart(bookId, num) {
	$.ajax({
		type: 'POST',
		url: '../shop/addCart' ,
	    data: {bookId: bookId, num: num} ,
	    cache: false,
	    dataType: 'text',
	    success: function(data) {
	    	if (data != '') {
		    	$("#simpleCart_total span").html(fmoney(data.split(",")[0], 2));
		    	$("#simpleCart_quantity").html(data.split(",")[1]);
	    	}
	    	else {
	    		alert("添加失败，请重试");
	    	}
	    },
	    error: function() {
	    	alert("添加失败，请重试");
	    }
	});
}

function emptyCart() {
	$.ajax({
		type: 'GET',
		url: '../shop/emptyCart' ,
	    cache: false,
	    dataType: 'text',
	    success: function(data) {
	    	$("#simpleCart_total span").html(0.00);
	    	$("#simpleCart_quantity").html(0);
	    },
	    error: function() {
	    	alert("清空失败，请重试");
	    }
	});
}

function removeCart(carHeader, id) {
	carHeader.fadeOut('slow', function(c) {
		$.getJSON("/Cart/deleteOne",{id:id},function () {
            location.href="/Cart/List";
        })
	});

	/*$.ajax({
		type: 'POST',
		url: '../shop/removeCart' ,
	    data: {bookId: bookId} ,
	    cache: false,
	    dataType: 'text',
	    success: function(data) {
	    	if (data != '') {
		    	$("#simpleCart_total span").html(fmoney(data.split(",")[0], 2));
		    	$("#simpleCart_quantity").html(data.split(",")[1]);
		    	$("#totalPrice").html(fmoney(data.split(",")[0], 2));
		    	$("#lastPrice").html(fmoney(data.split(",")[0], 2));
		    	$("#shoppingBag").html(parseInt($("#shoppingBag").html()) - 1);
		    	carHeader.fadeOut('slow', function(c) {
		    		carHeader.remove();
		    	});
	    	}
	    	else {
	    		alert("删除失败，请重试");
	    	}
	    },
	    error: function() {
	    	alert("删除失败，请重试");
	    }
	});*/
}