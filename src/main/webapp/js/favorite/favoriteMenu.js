var favoriteMenu = {


    favor : function(frm){
			var form = $(frm);
			if(form.is(':checked')){
				var obj = {
						itemIdx : form.data('itemidx'),
						favoriteItemIdx : '',
						url :"/mypage/menu/bookmark",
                    success: "즐겨 찾는 메뉴로 등록 완료되었습니다.",
                    fail: "즐겨 찾는 찾는 메뉴 등록이 실패하였습니다.",
						flag : "insert"
				};
				$.post("/mypage/menu/bookmark/count","POST", JSON.stringify(obj), function(data){
					if(!data.count){
                        alert('즐겨찾기는 최대 3개까지 등록 가능합니다.');
						form.prop('checked',false);
						return false;
					} else{
						favoriteMenu.favorMenuAjax(obj);
					}
				});
			} else{
                if (confirm('즐겨 찾는 메뉴에서 삭제하시겠습니까?')) {
					var obj = {
							itemIdx : form.data('itemidx'),
							favoriteItemIdx : form.data('favoriteitemidx'),
							url :"/mypage/menu/del",
                        success: "즐겨 찾는 메뉴에서 삭제되었습니다.",
                        fail: "즐겨 찾는 메뉴 삭제 실패하였습니다.",
							flag : "delete"
					};
					favoriteMenu.favorMenuAjax(obj);
				} else{
				form.prop('checked',true);
				}
			}
		},

		favorCnt : function(data){
			var obj = {
					itemIdx : data.itemIdx,
					favoriteItemIdx : '',
					url :"/mypage/menu/bookmark/count",
			};

            favoriteMenu.favorMenuAjax(obj);
		},

		favorMenuAjax : function(obj){

            var param = {
					itemIdx : obj.itemIdx,
					favoriteItemIdx : obj.favoriteItemIdx
			}
			$.post(obj.url,"POST", JSON.stringify(param), function(data){

                if(data.result){
					alert(obj.success);
				} else {
					alert(obj.fail);

                    if(data.flag == 'insert'){
						form.prop('checked',false);
					} else{
						form.prop('checked',true);
					}

                }
			}), function(data){
				alert("처리중 오류가 발생 하였습니다.\n잠시후 다시 실행 하여 주십시오.");
			}


        }

}