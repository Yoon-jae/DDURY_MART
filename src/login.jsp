<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!--login form css 참고사이트- 
http://designscrazed.org/css-html-login-form-templates/ 
http://codepen.io/GeBuOr/pen/mJJmgx.-->
<!DOCTYPE html>
<html lang='en'>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>떠리마트에 오신것을 환영합니다^^</title>
    
    
    <link rel="stylesheet" href="css/normalize.css">
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
	<link rel="stylesheet" href="css/login.css">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/login_main.js"></script>
    
    
  </head>

  <body>
    <div class="logmod">
  <div class="logmod__wrapper">
	
    <div class="logmod__container">
      <ul class="logmod__tabs">
        <li data-tabtar="lgm-2"><a href="#">Login</a></li>
        <li data-tabtar="lgm-1"><a href="#">Sign Up</a></li>
      </ul>
      <div class="logmod__tab-wrapper">
      <div class="logmod__tab lgm-1">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">떠리마트를 이용하기 위해 <strong>회원가입을 해주세요</strong></span>
        </div>
        <div class="logmod__form">
          <form action="join_proc.jsp" class="simform" method="post">
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name">Email*</label>
                <input name="MAKE_USER_EMAIL" class="string optional" maxlength="255" id="user-email" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input string optional">
                <label class="string optional" for="user-pw">비밀번호 *</label>
                <input name="MAKE_USER_PASS" class="string optional" maxlength="255" id="user-pw" placeholder="비밀번호" type="password" size="50" />
              </div>
              <div class="input string optional">
                <label class="string optional" for="user-pw-repeat">비밀번호를 다시입력해주세요 *</label>
                <input name="MAKE_USER_PASS_RE" class="string optional" maxlength="255" id="user-pw-repeat" placeholder="비밀번호를 다시입력해주세요" type="password" size="50" />
              </div>
            </div>
            <div class="simform__actions">
              <input class="sumbit" name="commit" type="submit" value="계정 생성"/>
            </div> 
          </form>
        </div> 
		<!--
        <div class="logmod__alter">
          <div class="logmod__alter-container">
            <a href="#" class="connect facebook">
              <div class="connect__icon">
                <i class="fa fa-facebook"></i>
              </div>
              <div class="connect__context">
                <span><strong>Facebook</strong>계정으로 가입하기</span>
              </div>
            </a>
              
            <a href="#" class="connect googleplus">
              <div class="connect__icon">
                <i class="fa fa-google-plus"></i>
              </div>
              <div class="connect__context">
                <span><strong>Google+</strong>계정으로 가입하기</span>
              </div>
            </a>
          </div>
        </div>
		-->
      </div>
	  
	  
      <div class="logmod__tab lgm-2">
        <div class="logmod__heading">
          <span class="logmod__heading-subtitle">떠리마트를 이용하기 위해서는 먼저 <strong>로그인이 필요합니다 </strong> </span>
        </div> 
        <div class="logmod__form">
          <form action="login_proc.jsp" class="simform" method="post">
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-name">Email*</label>
                <input name="USER_EMAIL" class="string optional" maxlength="255" id="user-email" placeholder="Email" type="email" size="50" />
              </div>
            </div>
            <div class="sminputs">
              <div class="input full">
                <label class="string optional" for="user-pw">비밀번호 *</label>
                <input name="USER_PASS" class="string optional" maxlength="255" id="user-pw" placeholder="비밀번호" type="password" size="50" />
                						<span class="hide-password">Show</span>
              </div>
            </div>
            <div class="simform__actions">
              <input class="sumbit" name="commit" type="submit" value="로그인" />
            </div> 
          </form>
        </div>
		<!--
        <div class="logmod__alter">
          <div class="logmod__alter-container">
            <a href="#" class="connect facebook">
              <div class="connect__icon">
                <i class="fa fa-facebook"></i>
              </div>
              <div class="connect__context">
                <span><strong>Facebook</strong>으로 로그인하기</span>
              </div>
            </a>
            <a href="#" class="connect googleplus">
              <div class="connect__icon">
                <i class="fa fa-google-plus"></i>
              </div>
              <div class="connect__context">
                <span><strong>Google+</strong>로 로그인하기</span>
              </div>
            </a>
          </div>
        </div>
		-->
      </div>
    </div>
  </div>
</div>


    
    
    
  </body>
</html>
