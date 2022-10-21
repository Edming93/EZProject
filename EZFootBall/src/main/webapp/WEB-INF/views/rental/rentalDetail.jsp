<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지풋볼</title>
<link rel="icon" href="./image/ez_con.png">
<style>
    * {
        box-sizing: border-box;
        margin: 0px;
    }
    
    
    .container {
        width: 100%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .header_container {
        width: 100%;
        height: 56px;
        display: flex;
        justify-content: center;
    }

    .header_area {
        width: 1024px;
        height: 100%;
        padding-top: 15px;
    }

    .header_content {
        display: flex;
        height: 100%;
        justify-content: space-between;
    }
    .header_left {
        width:70px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .main_logo{
    	/* background: url("${pageContext.request.contextPath}/image/ez_logo.svg") no-repeat center; */
    	background-size:65px 35px;
    	cursor: pointer;
    }
    .ez_icon {
        width: 65px;
        height:35px;
    }
    .search_input {
        width:375px;
        height:25px;

    }
    .header_right {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .big_menu_container {
        width: 100%;
        height: 70px;
        display: flex;
        justify-content: center;
	    margin-bottom: 13px;
	    margin-top: 13px;
        
    }
    .big_menu_area {
        max-width: 1024px;
        width: 1024px;
	    padding-top: 15px;
	    padding-bottom: 15px;
    }

    .big_menu_content {
        height: 100%;
        justify-content: flex-start;
        align-items: center;
    }

    .big_menu_content a {
        font-size: 18px;
        text-decoration: none;
        color: black;
        align-items: center;
        display: flex;
        width: 90px;
        justify-content: center;
    }
    
    .menu1,.menu2,.menu3,.menu4,.menu5 {
        width: 100px;
        justify-content: center;
        display: inline-block;
    }
    .menu1_a {
        font-weight: bold;
        padding-bottom:5px;
        border-bottom: 3px solid #0059df;
    }
    

    .banner_container {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        background-color: #fafafa;
    }
    .banner_content_area {
        max-width: 1024px;
        width:1024px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .banner_content {
        height: 448px;
        width: 1024px;
        /* 추후에 사이즈 media로 변경 */
    }
    .banner_image {
        width: 100%;
        height: 100%;
    }
    
    .filed_address {
        font-size: 13px;
    }

    .address_copy, .open_map {
        color: rgb(0, 60, 255);
    }

    .filed_container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    
    .filed_content_area{
        max-width: 1024px;
        width:1024px;
        display: flex;
        flex-direction: column;
        padding: 20px;
        border-bottom: 8px solid #eee;
    }

    .filed_content {
        display: flex;
    }

    .filed_address {
        margin-top: 10px;
    }

    .menu_container {
        display: flex;
        justify-content: center;
        
        
    }
    .menu_content {
        display: flex;
        width:1024px;
        max-width:1024px;
    }

    .menu_name {
        width: 80px;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }







    

    .bottom_banner {
        width:100%;
        height:205px;
        background-color: #cef8e8;
    }
    footer {
        width: 100%;
        height: 423px;
        display: flex;
        justify-content: space-evenly;   
        padding: 30px;
        background-color: #2a2a2a;
    }
    .footer_left {
        width:40%;

    }

    .footer_right {
        width:40%;

    }

    .login_icon {
        margin-left:15px;
    }
    .etc_icon {
        margin-left:10px;
    }

    

</style>
</head>
<body>
<div class="container">
    <div class="header_container">
        <div class="header_area">
            <div class="header_content">
                <div class="header_left main_logo">

                </div>
                <div class="header_right login_btn etc_btn">
                    <input type="text" class="search_input">
                    <div class="login_icon">
                        <a href="${pageContext.request.contextPath}/loginPage/login">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2ZM9 7C9 5.34315 10.3431 4 12 4C13.6569 4 15 5.34315 15 7C15 8.65685 13.6569 10 12 10C10.3431 10 9 8.65685 9 7Z" fill="#464A54"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 13.5C7.5502 13.5 5.07689 15.0054 3.93312 16.0093C3.22723 16.6288 3 17.4996 3 18.2447C3 20.3187 4.68132 22 6.75534 22H17.2447C19.3187 22 21 20.3187 21 18.2447C21 17.4996 20.7728 16.6288 20.0669 16.0093C18.9231 15.0054 16.4498 13.5 12 13.5ZM5.25244 17.5124C6.03934 16.8217 8.04626 15.5 12 15.5C15.9537 15.5 17.9607 16.8217 18.7476 17.5124C18.8856 17.6335 19 17.8668 19 18.2447C19 19.2141 18.2141 20 17.2447 20H6.75534C5.78589 20 5 19.2141 5 18.2447C5 17.8668 5.11441 17.6335 5.25244 17.5124Z" fill="#464A54"/>
                            </svg>
                        </a>
                    </div>
                    <div class="etc_icon">
                        <a href="${pageContext.request.contextPath}/etc/etc">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.5 10.5C6.32843 10.5 7 11.1716 7 12C7 12.8284 6.32843 13.5 5.5 13.5C4.67157 13.5 4 12.8284 4 12C4 11.1716 4.67157 10.5 5.5 10.5Z" fill="#464A54"/>
                                <path d="M12 10.5C12.8284 10.5 13.5 11.1716 13.5 12C13.5 12.8284 12.8284 13.5 12 13.5C11.1716 13.5 10.5 12.8284 10.5 12C10.5 11.1716 11.1716 10.5 12 10.5Z" fill="#464A54"/>
                                <path d="M18.5 10.5C19.3284 10.5 20 11.1716 20 12C20 12.8284 19.3284 13.5 18.5 13.5C17.6716 13.5 17 12.8284 17 12C17 11.1716 17.6716 10.5 18.5 10.5Z" fill="#464A54"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
        <div class="banner_container">
            <div class="banner_content_area">
                <div class="banner_content">
                    <img class="banner_image" src="image/as_hm_coner.jpg" alt="">
                </div>
            </div>
        </div>
        <div class="filed_container">
            <div class="filed_content_area">
                <h3 class="filed_name">HM 풋살 파크 안산 고잔점 난 오늘도 콘서트를 열지..훗</h3>
                <div class="filed_address">경기 안산시 단원구 광덕대로 175
                    <span class="address_copy">주소 복사</span>
                    <span class="open_map">지도 보기</span>
                </div>
            </div>
        </div>
        <div class="menu_container">
            <div class="menu_content">
                <div class="menu_name field_info">시설</div>
                <div class="menu_name filed_reservation">구장 예약</div>
            </div>
        </div>
        


    <div class="bottom_banner">


    </div>
    <footer>
        <div class="footer_left"></div>
        <div class="footer_right"></div>
        
    </footer>

	<script type="text/javascript">
		let main_logo = document.querySelector(".main_logo");
		
		main_logo.addEventListener("click",function() {
			location.href="${pageContext.request.contextPath}";
		});
	</script>
</div>
</body>
</html>