# web_project_subway
<h2>프로젝트 초기 기획</h2>
클론 사이트 리스트업<br>
ERD 회의 및 SFD 작성<br>
업무 분배 및 개별 RND<br>
<h2>개별 개발 현황</h2>
<h4>원도현</h4>
<ul>
  <li>차트, AJAX, 이미지 업로드 R&D</li>
  <li>상품리스트 AJAX로 구현</li>
  <li>이름(영문명포함), 상품코드로 검색 기능 구현</li>
  <li>새 상품 등록 클릭 시 상품 등록 페이지로 이동</li>
  <li>정규식을 이용한 유효성 검사, 정규식과 맞지 않는 문자열 입력 시 빈공백으로 교체, 글자수 제한</li>
  <li>이미지 선택시 미리보기 구현</li>
  <li>입력 클릭 시 DB에 등록 및 상품 리스트 페이지로 이동</li>
  <li>수정 클릭 시 상품 수정 페이지로 이동</li>
  <li>이미지가 이미 등록되어 있다면 파일선택에서 이미지를 선택 하지 않아도 DB 수정이 가능하도록 구현</li>
</ul>
<h4>김소리</h4>
<ul>
  <li>로그인 화면 : 데이터 베이스에 저장되어 있는 회원 아이디와 비밀번호가 맞는지 ajax를 통해 확인후 로그인 가능하도록 구현</li>
  <li>회원가입 화면 :</li>
  <li>회원 아이디, 비밀번호, 이름, 생년월일, 주소, 전화번호 받아 데이터베이스에 추가하는 작업 완료</li>
  <li>주소는 daum 주소 api 받아 입력 하도록 구현</li>
  <li>연도에 따라 윤년 계산하여 2월 일수 콤보박스 변하도록 설정 및 선택 월에 따라 날짜 수 변하도록 구현</li>
  <li>ajax 사용하여 아이디 중복확인 기능 구현</li>
  <li>아이디는 영어 소문자, 숫자만 사용하여 최대 15자 까지 입력할 수 있도록 구현</li>
  <li>비밀번호는 영어, 숫자, 특수문자만 사용하여 최대 15자 까지 입력할 수 있도록 구현</li>
  <li>이름은 한글, 영어만 사용하여 최대 5자 까지 입력할 수 있도록 구현</li>
  <li>전화번호 가운데자리와 끝자리는 숫자만 입력 가능하고 최대 4자 까지 입력할 수 있도록 구현</li>
  <li>+ 이메일 입력받는 칸 추가하여 메일 전송 api 연결 할 예정</li>
</ul>
<h4>김태우</h4>
