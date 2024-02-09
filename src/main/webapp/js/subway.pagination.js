/**
 * 써브웨이 페이징 공통함수
 */

var pagination = {
		requestData : {
			pageNo : 1,
			itemCountPerPage : 3,
			displayPageNoCount : 5
		},
		responseData : null,
		pagerId : null,
		onclick : null,
		
		requestPage : function(data) {
			//  요청할 페이지 번호
			pagination.requestData.pageNo = data.pageNo;
			
			//  페이징 관련 데이터를 요청 파라메터에 추가
			data.param.pagination = JSON.stringify(pagination.requestData);

	        $.ajax({
	            type: "POST",
	            url: data.url,
	            data: $.param(data.param),
	            cache: false,
	            success: function (result) {
	        		//  pagination 처리
	        		pagination.requestData = JSON.parse(result["pagination"]).requestData;
	        		pagination.responseData = JSON.parse(result["pagination"]).responseData;
	        		
	        		pagination.display();
	        		
	        		if (data.success != null)
	        			data.success(result);
	            },
	            error: function (xhr, ajaxOptions, thrownError) {
	            	if (data.error != null)
	            		data.error(xhr, ajaxOptions, thrownError);
	            }
	        });
		},
		
		display : function() {
			var iterPageNo = pagination.responseData.displayStartPageNo;
			var requestData = pagination.requestData;
			var responseData = pagination.responseData;
			
			if (responseData.maxPageNo == 0) {
	    		$(pagination.pagerId).html("");
				return;
			}
			
			if (pagination.onclick == null) {
				//  Prev 버튼
				html = "<a href='javascript:void(0);' class='arr prev'></a>";

				//  PageNo 버튼
	    		for (; iterPageNo <= responseData.displayEndPageNo ; iterPageNo++) {
	    			if (iterPageNo == requestData.pageNo) {
	    				html += "<strong>" + iterPageNo + "</strong>";
	    			}
	    			else {
	    				html += "<a href='javascript:void(0);'>" + iterPageNo + "</a>";
	    			}
	    		}
	    		
	    		//  Next 버튼
				html += "<a href='javascript:void(0);' class='arr next'></a>";		
			}
			else {
				//  Prev 버튼
	    		html = "<a href=\"javascript:void(0);\" onclick=\"pagination.onclick('prev', "
	    				+ (requestData.pageNo == 1 ? 1 : requestData.pageNo - 1)
	    				+ ")\" class='arr prev'></a>";
				
				//  PageNo 버튼
	    		for (; iterPageNo <= responseData.displayEndPageNo ; iterPageNo++) {
	    			if (iterPageNo == requestData.pageNo) {
	    				html += "<a href=\"javascript:void(0);\" class='active'>" + iterPageNo + "</a>";
	    			}
	    			else {
	    				html += "<a href=\"javascript:void(0);\" onclick=\"pagination.onclick('pageNo', " + iterPageNo + ")\">" + iterPageNo + "</a>";
	    			}
	    		}
	    		
	    		// Next 버튼
	    		html += "<a href=\"javascript:void(0);\" onclick=\"pagination.onclick('next', "
					+ (requestData.pageNo == responseData.maxPageNo ? requestData.pageNo : requestData.pageNo + 1)
	    			+ ")\" class='arr next'></a>";
			}

    		$(pagination.pagerId).html(html);
		}
	}