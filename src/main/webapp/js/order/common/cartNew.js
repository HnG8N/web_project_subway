/**
 * 장바구니 관련js 파일 생성.
 * 24.02.22
 */
var cart = {
	init : function(){
		// 수량변경
		$(".minus, .plus").on("click", cart.changeQty);
		// 선택된 상품에 따른 총 주문금액 재계산
		$("input[type=checkbox]").on("click", cart.selectEachItem);
		// 장바구니 상품 삭제
		$("#cartItemDelete").on("click", cart.deleteCartItem);
		// 메뉴추가하기
		$("#addMenu").on("click", cart.addMenu);
		// 지점변경
		$("#changeStore").on("click", cart.changeStore);
		// 주문하기
		$("#setOrder").on("click", cart.getOrderData);
	},
	
	// 총 주문금액 세팅
	totalOrderPrice : function(target) {
		var totalPrice = 0;
		$.each(target, function(idx, item) {
			totalPrice += ($(item).find("[name=eachPrice]").val() * $(item).find("[name=qty]").val());
		});
		$("#totalPrice").text(subwayCommon.numberToCurrencyFormat(totalPrice));
	},
	
	// 상품 수량변경
	changeQty : function(e) {

		var target = $(e.target);
		var row = target.parents("[data-target=row]");
		var qtyTarget = target.siblings("[name=qty]");
		var qty = parseInt(qtyTarget.val());
		var flag = target.hasClass("plus");
		var limitQty = data.getMaximumQty();

		// 수량이 1 미만으로 내려가지 않도록
		if(qty <= 1 && !flag) { alert("최저수량은 1개입니다."); return; }

		// 클릭되어 변경된 수량 반영
		qty = qty + (flag ? 1 : -1);
		if("Y" != row.data("side") && qty > limitQty) {
			alert("최대 주문수량은 " + limitQty + "개 입니다.\n\n" + limitQty + "개 이상은 단체주문을 이용하시기 바랍니다.");
			qtyTarget.val(limitQty);
			return;
		}
		qtyTarget.val(qty);
		row.find(".amount em").text(qty);

		// 수량 업데이트
		data.cartUpdate("chageQty", {"cartIdx" : row.data("cartidx"), "qty" : qty}, function(data) {
			// 수량 변경시 금액, 총 주문금액 변경
			if(data > 0)
				row.find(".eachTotalPrice").text(subwayCommon.numberToCurrencyFormat(row.find("[name=eachPrice]").val() * qty));
				var selectTargeyt = $("input[type=checkbox]:checked").parents("[data-target=row]");
				cart.totalOrderPrice(selectTargeyt);
		});
	},

	// 상품 선택시 총 주문금액 변경
	selectEachItem : function(e) {
		var eventTarget = $(e.target);

		// 전체 선택일경우 하위 체크박스 선택
		if("all" == eventTarget.data("target"))
			eventTarget.parents(".cart").find("[data-target=row] [data-target=each]").prop("checked", eventTarget.prop("checked"));

		// 선택된 상품
		var selectTargeyt = $("input[type=checkbox]:checked").parents("[data-target=row]");
		cart.totalOrderPrice(selectTargeyt);
	},

	// 선택된 상품 삭제
	deleteCartItem : function() {
		var selectTarget = $("[data-target=each]:checked");

		// 삭제할 상품 없을경우
		if(selectTarget.length < 1) {alert("삭제할 상품을 선택하세요."); return;}

		if(confirm("선택한 상품을 삭제하시겠습니까?")) {
			var cartIdxArr = new Array();
			selectTarget.parents("[data-target=row], [data-target=soldout]").each(function() {
				cartIdxArr.push($(this).data("cartidx"));
			});
			alert(cartIdxArr);
			console.log(cartIdxArr);
			data.cartUpdate("deleteCartItem", {"cartIdxArr[]" : cartIdxArr}, function() {
				alert("선택한 " + cartIdxArr.length +"개의 상품이 삭제되었습니다.");
				location.reload(); }
			);
		}
	},

	// 매뉴추가하기
	addMenu : function() {
		var orderForm = $("[name=orderForm]");
		data.addStorInfo($("[name=orderForm]").serialize(), "step2.do");
	},

	// 픽업매장 변경하기
	changeStore : function() {
		if(confirm("현재 선택된 매장과 다른 매장을 선택할경우 장바구니에 담긴 상품은 삭제됩니다. 변경하시겠습니까?")) {
			var target = $(this);
			var url = target.data("url") + "?storCd=" + target.data("stor");
			location.href = url;
		}
	},

	// 주문하기
	getOrderData : function() {
		// 선택한 상품의 카트id Array
		var selectTarget = $("[data-target=each]:checked");
		var dataTarget = selectTarget.parents("[data-target=row]");
		if(selectTarget.length < 1) {alert("주문할 상품을 선택해주세요."); return;}
		if(selectTarget.length != dataTarget.length) {alert("품절상품은 주문할 수 없습니다."); return;}

		var dataOrderableYn = selectTarget.parents("[data-orderableYn=N]");
		if (dataOrderableYn.length > 0) {
			alert("주문할 수 없는 상품이 포함되어 있습니다. 다시 선택해주세요.");
			return;
		}

		if(confirm("선택한 상품을 주문하시겠습니까?")) {
			var totalQty = 0;
			var cartIdxArr = new Array();

			dataTarget.each(function() {
				var target = $(this);
				if("Y" != target.data("side")) { totalQty += parseInt(target.find("[name=qty]").val()); }
				cartIdxArr.push(target.data("cartidx"));
			});

			// validation
			var maxQty = data.getMaximumQty();
			if(totalQty > maxQty) {
				alert("1회 주문시 최대 " + maxQty + "개까지 주문하실 수 있습니다.");
				return;
			}

			// 주문 실행
			data.cartUpdate("GetOrderNum", {"cartIdxArr[]" : cartIdxArr, "cartType" : $(this).data("cart-type")}, function(data) {
			 	//alert("return data : "+data);
				if(data != null) {
					data = data.replace(/"/g, '');
					location.href = "gotoOrder.do?ordNo="+data;
				}
			});
		}
	}
}
var data = {
	// 장바구니 데이터 변경
	cartUpdate : function(url, data, callBack) {
		$.ajax({
			type: "POST",
			url: url,
			data: data,
			async: false,
			success: function (result) {	// callBack이 뭔지 확인하고 결과이후 수량 변경하기.
				if ("function" == typeof callBack)
					callBack(result);
			},
			error: function (xhr, ajaxOptions, thrownError) {
				subwayCommon.errorAjaxProcess(xhr);
			}
		});
	},
	
	// fast-sub:5개, home-sub:10개 제한
	getMaximumQty : function() {
		if (cartGubun == 'home') {
			return 10;
		} else {
			return 5;
		}
	}
}			
$(document).ready(function() {
	cart.init();
});