var fileUpload = {
	path : "",
	loddingId: "",
	storedFiles: [],
	fileSize : 0,
	init: function(path, loddingId, fileId) {
		fileUpload.path = path;
		fileUpload.loddingId = loddingId == "undefined" || loddingId == null || loddingId == "" ? document.body : loddingId;
		if(jQuery.type(fileId) == "string") {
			$(fileId).on("change", fileUpload._handleFileSelect);
		} else if(jQuery.type(fileId) == "array") {
			for(var i=0;i<fileId.length;i++) {
				$(fileId[i]).on("change", fileUpload._handleFileSelect);
			}
		}
	},
	_limitAttach: function(file) {
		var extArray = new Array(".pdf", ".doc", ".ppt", ".xls", ".docx", ".pptx", ".xlsx", ".jpg", ".gif", ".png", ".bmp"); //첨부가능한 확장자 목록
		var allowSubmit = true;
        if (!file) return;
        while (file.indexOf("\\") != -1)
            file = file.slice(file.indexOf("\\") + 1);
        ext = file.slice(file.indexOf(".")).toLowerCase();
        for (var i = 0; i < extArray.length; i++) {
            if (extArray[i].toLowerCase() == ext.toLowerCase()) { allowSubmit = false; break; }
        }
        return allowSubmit;
	},
	_handleFileSelect: function(e) {
		fileUpload.storedFiles = [];
		$("#" + e.target.id).next("input").val("");

		var maxUpload = $("#"+e.target.id).data("maxupload");
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var fileLength = fileUpload.fileLength();

		//파일 사이즈 체크

        filesArr.forEach(function(f) {
        	f.fieldId = e.target.id;
        	if(fileUpload._limitAttach(f.name)) {
	    		alert("첨부가 불가능한 파일 입니다.\n실행 파일 또는 소스파일은 업로드 불가 입니다.");
	        return;
        }

        	var maxSize = ($("#"+e.target.id).data("maxsize") == undefined || $("#"+e.target.id).data("maxsize") == "") ? 0 : $("#"+e.target.id).data("maxsize");
         	var fileSize = f.size;
         	var checkSize = Number(maxSize) * 1024 * 1024;

         	//제한 사이즈가 있다면 체크 한다!!
         	if (maxSize > 0) {
         		if (isNaN(checkSize)){
         			alert("제한 사이즈가 잘못 등록되었습니다.");
         			return;
         		}
         		if (fileSize > checkSize) {
         			alert("첨부 최대 사이즈는 " + maxSize + "MB 입니다.\n첨부 파일을 확인 하여 주십시오.");
         			return false;
         		}

         		if ((fileUpload.fileSize + fileSize) > checkSize) {
         			alert("첨부 최대 사이즈는 " + maxSize + "MB 입니다.\n첨부 파일을 확인 하여 주십시오.");
         			return false;
         		}

         		fileUpload.fileSize = fileUpload.fileSize + fileSize;
         	}



        	if(maxUpload <= fileLength) {
        		alert("파일은 최대 " + maxUpload + "까지 등록가능합니다.");
            return;
        	}

        	var displayId = $("#"+e.target.id).data("displayid");
        	if(displayId != null && displayId !="" && displayId != undefined) {
        	    var html =  "<li><span>" + f.name + "&nbsp;</span>";
             	html += '<button type="button" data-fieldid="'+f.fieldId+'" data-size="'+f.size+'" data-filename="'+f.name+'" class="btn xs default" onclick="fileUpload._removeFile(this);">삭제</button></li>';
             	if(!e.target.multiple) {
             		$("#"+displayId).children("div").not(":first").remove();
         		}
             	$("#"+displayId).append(html);
             	$("#"+displayId).show();
        	}

        	fileUpload.storedFiles.push(f);
    		$("#" + e.target.id).next("input").val(f.name);
        });
	},
	_removeFile : function(ts){
		var file = new Object();
		file.fieldId = $(ts).data("fieldid");
		file.name = $(ts).data("filename");

		fileUpload.fileSize = fileUpload.fileSize - Number($(ts).data("size"));

		for(var i=0;i<fileUpload.storedFiles.length;i++) {
            if(fileUpload.storedFiles[i].fieldId === file.fieldId && fileUpload.storedFiles[i].name === file.name) {
            	fileUpload.storedFiles.splice(i,1);
                break;
            }
        }
		if ($.browser.msie) {
			$("#"+file.fieldId).replaceWith( $("#"+file.fieldId).clone(true) );
		} else {
			$("#"+file.fieldId).val("");
		}
		$(ts).parent().remove();
		//console.log(fileUpload.storedFiles)
	},
	fileLength : function(){
		return fileUpload.storedFiles.length;
	},
	validAttach: function(id1, id2) {

    	var result = true;

    	var $newfile = $(id1);
		var file = $(id2);

		var chkNewFile = false;

		//등록된 파일이 있는지 확인
		if(file.length > 0 && file.val() != "") {
			chkNewFile = false;
		} else {
			chkNewFile = true;
		}

		if(chkNewFile) {

			var cnt = 0;
			for(var i=0, len=fileUpload.storedFiles.length; i<len; i++) {
				if(fileUpload.storedFiles[i].fieldId === $newfile.attr("id")) {
					cnt++;
				}
	        }

			if(cnt == 0) {
				alert("파일을 첨부 하여 주십시오.");
				if ($.browser.msie) {
					$newfile.replaceWith( $newfile.clone(true) );
				} else {
					$newfile.val("");
				}
        		result = false;
			}
		}

		return result;
    },
	_createProgressBar: function() {
		var Html = "";
			Html += "<div class='progress' style='margin-bottom:0px;float:left; width:100%;margin-top:5px;' id='ui_file_upload_progressbar' >";
			Html += "  <div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='0' aria-valuemin='0' aria-valuemax='100' style='width:0%'>";
	        Html += "    <span class='bar' id='ui_file_upload_progress'>0% Complete (success)</span>";
	        Html += "  </div>";
	        Html += "</div>";
	   return Html;
	},
	upload: function(callback) {
		if (fileUpload.fileLength() == 0) {
			alert("업로드할 파일을 등록 하여 주십시오.");
			return false;
		}
		fileUpload._blockingMask(fileUpload.loddingId, "업로드 처리중..");

		setTimeout(function(){
			$(".blockMsg").html(fileUpload._createProgressBar());
			fileUpload._send(callback);
		}, 1000);
	},
	_send: function(callback) {
		var data = new FormData();
        for(var i=0, len=fileUpload.storedFiles.length; i<len; i++) {
            data.append("file"+i, fileUpload.storedFiles[i]);
        }

		$.ajax({
            url: fileUpload.path, //server script to process data
            type: 'POST',
            xhr: function () {
                myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) {
                    myXhr.upload.addEventListener('progress', progressHandlingFunction, false);
                }
                return myXhr;
            },
            data: data,
			dataType : "text",
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
            	if(result != null) {
	            	var s = 100;
	            	$("#ui_file_upload_progress").text(s + "%");
	                $("#ui_file_upload_progressbar").children(".progress-bar").css("width", s + "%").attr("aria-valuenow", s);
	                $(".blockMsg").html("파일 업로드 처리중..");
	                setTimeout(function(){
	                	fileUpload._unBlockingMask(fileUpload.loddingId);
	                	callback(result, true);
	        		}, 1000);
            	} else {
            		fileUpload._unBlockingMask(fileUpload.loddingId);
            		alert("업로드 처리 실패 하였습니다.");
            		return;
            	}
            },
			error : function(request, status, errorThrown) {
				fileUpload._unBlockingMask(fileUpload.loddingId);
				callback(request, false);
			}
        });
        function progressHandlingFunction(e) {
            if (e.lengthComputable) {
                var s = parseInt((e.loaded / e.total) * 100);
                $("#ui_file_upload_progress").text(s + "%");
                $("#ui_file_upload_progressbar").children(".progress-bar").css("width", s + "%").attr("aria-valuenow", s);
            }
        }
	},
    /*====================================================================================
    ' 함수명 : fileUploadGlobal.blockingMask(id, msg)
    ' 인  수 : msg - 로딩 메세지
    '          id  - Element ID
    ' 기  능 : 특정 Element 마스크 처리 및 로딩문구 노출
    ' 리턴값 : 없음.
    '=====================================================================================*/
    _blockingMask: function (id, msg) {
        $(id).block({
            message: (msg == "" || msg == undefined) ? "Please Wait..." : msg,
            css: {
                border: 'none',
                padding: '15px',
                //backgroundColor: '#eee',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: 5,
                color: '#000'
            },
            overlayCSS: {
                backgroundColor: '#a7a7a7',
                opacity: 0.6,
                cursor: 'wait'
            }
        });
    },
    /*====================================================================================
    ' 함수명 : fileUploadGlobal.unBlockingMask(id, msg)
    ' 인  수 : msg - 완료 메세지
    '          id  - Element ID
    ' 기  능 : 특정 Element 마스크 해제 처리
    ' 리턴값 : 없음.
     '=====================================================================================*/
    _unBlockingMask : function(id, msg){
        if (msg == "" || msg == undefined) {
            $(id).unblock();
        }
        else {
            $(id).unblock({
                onUnblock: function () {
                    alert(msg);
                }
            });
        }
    }
}