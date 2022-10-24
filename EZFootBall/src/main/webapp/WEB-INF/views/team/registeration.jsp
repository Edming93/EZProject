<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀매치 - 팀등록</title>
    
    <link rel="stylesheet" href="./js/jquery-ui.css"/>
    <script src="./js/jquery-3.6.1.min.js"></script>
    <script src="./js/jquery-ui.js"></script>
    <style>
    *{
        box-sizing : border-box;
        margin : 2px auto;
        
     
    }
    .posting{
        display: flex;
        background-color: beige;
        flex-direction: column;
        width: 500px;
        border: 1px solid white;
    }
    
    .team_info{
        display: flex;
        flex-direction: column;
    }
    .team_info .team_register{
        display: flex;
        justify-content: center;
        font-weight: 700;
        font-size: 40px;
        width: 500px;
        padding-left: 5px;
    }
    .team_info .team_name{
        width: 500px;
        float: left;
       
       
    }
    .team_info .team_name p{
        margin-left: 5px;
        font-weight: 700;
        font-size: 20px;
    }
    .team_info .team_name input{
        width: 490px;
        height: 40px;
        margin-left: 5px;
    }
    .team_info table{
        background-color: white;
        width : 98%;
        
    }
    .team_info table tr td input{
        
        width: 100%;
        float: left;
        padding-left: 5px;
    }

    .submit_button{
        width: 480px;
        height: 40px;
        background-color: black;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #writer_submit{
        width: 480px;
        height: 40px;
        background-color: black;
        border: none;
        color: white;
        font-weight: 700;
        font-size: 15px;
    }
    #writer_submit:hover{
        cursor: pointer;
    }
    .add_info{
    	color : red;
    	text-decoration : underline;
    }
   
    </style>
    
</head>
<body>
    <div class="posting">
       
        <div class="team_info">
            <div class="team_register">
                <p>팀 등록하기</p>
            </div>
            <form action="${pageContext.request.contextPath}/team/teamUpdate" method="post">
            <div class="team_name">
                <p>팀 이름</p>
                <input type="text" name="teamName" id="teamName" placeholder="매력있는 팀 이름 정하기">
            </div>
            <p class="add_info">※5명팀은 5명만 적어주세요</p>
            <table>
                <tr>
                    <th>이름</th>
                    <th>회원코드</th>
                </tr>
                <tr>
                    <td><input type="text" name="tmember1" id="tmember1" placeholder="이름을 입력하세요"></td>
                    <td><input type="text" name="userCode1" id="userCode1" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember2" id="tmember2" placeholder="이름을 입력하세요"></td>
                    <td><input type="text" name="userCode2" id="userCode2" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember3" id="tmember3" placeholder="이름을 입력하세요"></td>
                    <td><input type="text" name="userCode3" id="userCode4" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember4" id="tmember4" placeholder="이름을 입력하세요"></td>
                    <td><input type="text" name="userCode4" id="userCode4" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember5" id="tmember5" placeholder="이름을 입력하세요"></td>
                    <td><input type="text" name="userCode5" id="userCode5" placeholder="회원코드"></td>
                </tr>
                <tr>
                    <td><input type="text" name="tmember6" id="tmember6" placeholder="이름을 입력하세요"></td>
                    <td><input type="text" name="userCode6" id="userCode6" placeholder="회원코드"></td>
                </tr>
            </table>
            
            <div class="submit_button">
            	<button id="writer_submit">팀 등록하기</button>
        	</div>
        	 </form>
        </div>
    </div>
  
   	


</body>
</html>