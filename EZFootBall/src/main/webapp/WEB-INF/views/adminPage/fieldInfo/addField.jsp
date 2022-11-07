<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menu2 {
		background-color: #f8ede3;
	}
    .field_container {
        display: flex;
        flex-direction: column;
    }
    .area_box {
        display: flex;
    }

    .left_content {
        width: 50%;
        border: 1px solid black;
        padding:20px;
    }
    .right_content {
        width: 50%;
        border: 1px solid black;
        padding:20px;
        display: flex;
        flex-direction: column;
    }
    .select {
        height: 39px;
    }
    .input {
        height:30px;
    }

    .image_area {
        width:100%;
        height:300px;
        border: 1px solid black;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .file_box {
        margin-top: 10px;
        display: flex;
        justify-content: flex-end;
    }
    
    .image_file_name {
        width: 50%;
        padding-left:10px;
    }
    .input_file_button{
        padding: 5px 15px;
        background-color: #f8ede3;
        border-radius: 4px;
        color: black;
        cursor: pointer;
        margin-left:10px;
    }
    .buttons {
        width:7%;
        margin-left: 10px;
    }
    
</style>
</head>
<body>
<!-- <form action="${pageContext.request.contextPath}/admin/fieldAdd" method="get"> -->
    <div class="field_container">
        <div class="field_title">
            <h1>구장 추가</h1>
        </div>
        

        <div class="area_box">
            <div class="left_content">
                <div class="image_area">
                    <div class="image_content">
                        <span class="image_span">image를 추가해주세요</span>
                    </div>
                </div>
                <div class="file_add_area">
                    <div class="file_box">
                        <input type="text" class="image_file_name" id="select_file" placeholder="선택된 파일없음" readonly>
                        <label class="input_file_button" for="input_file">
                            파일선택
                        </label>
                        <input type="file" class="input_file" id="input_file" style="display:none">
                        
                        <button class="add_btn buttons">+</button>
                    </div>
                </div>
            </div>
            <div class="right_content">
                <label for="search_local">지역명 : </label>
                <select name="gamePlace" id="search_local" class="select">
                    <option id="null" value="null">지역선택</option>
                    <option id="서울" value="서울">서울</option>
                    <option id="인천" value="인천">인천</option>
                    <option id="경기도" value="경기">경기도</option>
                    <option id="강원도" value="강원">강원도</option>
                    <option id="경상도" value="경상">경상도</option>
                    <option id="전라도" value="전라">전라도</option>
                    <option id="충청도" value="충청">충청도</option>
                    <option id="제주도" value="제주">제주도</option>
                </select><br>

                <label for="field_name">구장명 : </label>
                <input type="text" class="input" id="field_name" name="fieldName"><br>
                <label for="field_address">구장주소 : </label>
                <input type="text" class="input" id="field_address" name="fieldAddress"><br>
                <label for="field_call">구장연락처 : </label>
                <input type="text" class="input" id="field_call" name="fieldCall"><br>
                <label for="field_rentalfee">구장대여료 : </label>
                <input type="text" class="input" id="field_rentalfee" name="fieldRentalfee"><br>
                <label for="field_type">구장형태 : </label>
                <input type="text" class="input" id="field_type" name="fieldType"><br>
                <label for="field_size">구장크기 : </label>
                <input type="text" class="input" id="field_size" name="fieldSize"><br>
                <label for="field_in_out">내외여부 : </label>
                <input type="text" class="input" id="field_in_out" name="fieldInOut"><br>
                <label for="field_grass">잔디여부 : </label>
                <input type="text" class="input" id="field_grass" name="fieldGrass"><br>
            </div>
        </div>            
    </div>
<!-- </form> -->
    <script>
        let image_add_btn = document.querySelector(".add_btn");
        let file_add_area = document.querySelector(".file_add_area");
        
        image_add_btn.addEventListener("click",function() {
            let file_box = document.createElement("div");
            file_box.className = "file_box";
            
            let image_file_name = document.createElement("input");
            image_file_name.type="text";
            image_file_name.className = "image_file_name";
            image_file_name.placeholder = "선택된 파일없음";
            image_file_name.readOnly="true";
            image_file_name.id = "select_file";

            let input_file_label = document.createElement("label");
            input_file_label.className="input_file_button";
            input_file_label.innerText ="파일선택";
            input_file_label.htmlFor = 'input_file';

            let input_file = document.createElement("input");
            input_file.type ="file";
            input_file.id = "input_file";
            input_file.className = "input_file";
            input_file.style.display ="none";
            
            let delete_btn = document.createElement("button");
            delete_btn.className = "delete_btn buttons";
            delete_btn.innerText = "-";
            
            file_box.append(image_file_name);
            file_box.append(input_file_label);
            file_box.append(input_file);
            file_box.append(delete_btn);

            file_add_area.append(file_box);

        });

        let delete_btn = document.querySelectorAll(".delete_btn");
        
            delete_btn.forEach(function(e) {
                console.log(e);
                console.log(this);
                e.addEventListener("click",function() {
                    console.log(e.parentElement);
                    console.log(e.parentNode);
                    e.parentElement.remove;
                });
            });
        


        let image_span = document.querySelector(".image_span");
        let image_name_inputs = document.querySelectorAll(".image_file_name");
        let input_files = document.querySelectorAll(".input_file");
        

        let file_boxes = document.querySelectorAll(".file_box");
            console.log(file_boxes.length);

            for(let i=0; i<input_files.length; i++) {
                input_files[i].addEventListener('change', function(){
                    console.log(input_files[i]);
                    console.log(image_name_inputs[i]);

                    if(input_files[i].files[0] == undefined){
                        image_name_inputs[i].value = '선택된 파일이 없습니다.';
                        image_span.innerHTML = 'image를 추가해주세요';
                            
                        return;
                    }else{
                        image_name_inputs[i].value = input_files[i].files[0].name;  
                    };
                });
            };

    </script>









	     	<script type="text/javascript">
	    //  		let field_modify = document.querySelector(".field_modify");
	    //  		let field_delete = document.querySelector(".field_delete");
	    //  		let check_boxes = document.querySelectorAll(".check_box");
	    //  		let f_cnt = 0;
	    //  		let t_cnt = 0;
	     		
	    //  		field_modify.addEventListener("click",function() {
	    //  			check_boxes.forEach(function(e){
	    //  				if(e.checked == false){
	    //  					f_cnt++;
	    //  				}else{
	    //  					t_cnt++;
	    //  					field_modify.type="submit";
	    //  				}
	    //  			});
		//      			if(t_cnt > 1){
		//      				field_modify.type="button";
		// 					alert("하나의 정보만 수정해주세요.");
		// 					t_cnt=0;
		//      			}else if(check_boxes.length == f_cnt){
		//      				field_modify.type="button";
		//      				alert("수정할 정보가 없습니다!");
		//      				f_cnt=0;
		//      			}
	    //  		});
	     		
	    //  		field_delete.addEventListener("click",function() {
	    //  			check_boxes.forEach(function(e){
	    //  				if(e.checked == false){
	    //  					f_cnt++;
	    //  				}
	    //  			});
		// 		if(check_boxes.length == f_cnt){
		// 				field_delete.type="button";
	    //  				alert("삭제할 정보가 없습니다!");
	    //  				f_cnt=0;
	    //  			}else {
	    //  				if(confirm("정말 삭제하시겠습니까? 메인 게임리스트,구장예약에서도 모든 정보가 삭제됩니다.")){
	    //  					alert("선택 구장에 관련된 모든 정보가 삭제됩니다.");
	    //  					field_delete.type="submit";
	    //  				}else {
	    //  					field_delete.type="button";
	    //  				}
	     				
	    //  			}
	    //  		});
	      	</script>
	     
         	<script type="text/javascript">
	    //         var local = document.getElementById("search_local");
		// 		var content = document.querySelectorAll(".content");
		// 		var input = document.getElementById("input_content");
				
				
 	    //         local.addEventListener("change",function() {
		// 		var field_address =document.querySelectorAll(".address");
				
		// 		for(let i=0; i<field_address.length; i++){
		// 			if(local.value == "null" && input.value == "") {
		// 					content[i].style.display ="";
		// 			}else{
		// 					let address = field_address[i].innerText;
		// 					// name에 있는 문장에 local.value값이 포함됐을 때 시작지점이 몇번째인지 반환, -1은 값이 없을때
		// 					if(address.indexOf(local.value) != -1) {
		// 						content[i].style.display = "";
		// 					} else {
		// 						content[i].style.display = "none";
		// 					}
		// 				}
		// 			}
 	    //         });
 	            
 	    //         input.addEventListener("input",function() {
 	    //         	local.value = "null";
 		// 			var field_name =document.querySelectorAll(".name");
 					
 		// 			for(let i=0; i<field_name.length; i++){
 		// 				if(local.value == "null" && input.value == "") {
 		// 						content[i].style.display ="";
 		// 				}else{
 		// 						let name = field_name[i].innerText;
 		// 						console.log(name.indexOf(input.value));
 		// 						// name에 있는 문장에 local.value값이 포함됐을 때 시작지점이 몇번째인지 반환, -1은 값이 없을때
 		// 						if(name.indexOf(input.value) != -1) {
 		// 							content[i].style.display = "";
 		// 						} else {
 		// 							content[i].style.display = "none";
 		// 						}
 		// 					}
 		// 				}
 	 	//             });
	         </script>

         <script>
        //     let select_all_btn = document.getElementById("select_all");
        //     let select_check_btn = document.querySelectorAll(".check_btn");

        //     select_all_btn.addEventListener("click",function() {
        //         select_check_btn.forEach(function(e){
        //             if(select_all_btn.checked == true){
        //                 e.checked = true;
                        
        //             }else if(select_all_btn.checked != true){
        //                 e.checked = false;
        //             }
        //         });
        //     });
            
        //     select_check_btn.forEach(function(event){
        //     	event.addEventListener("click",function() {
    	//         	select_all_btn.checked = false;
    	//         });
        //     });

            
        </script>

</body>
</html>