# web_project_subway
<h1>팀원 : 김수진, 김소리, 원도현, 기태우</h1>
<h2>프로젝트 기획</h2>
<ul>
  <li>클론 사이트 리스트업</li>
  <li>ERD 회의 및 SFD 작성</li>
  <li>업무 분배 및 개별 RND</li>
  <li>24.02.13 DB, server 통합 예정</li>
</ul>
<h2>ERD</h2>
<img width="865" alt="스크린샷 2024-02-08 오전 10 37 39" src="https://github.com/HnG8N/web_project_subway/assets/151720731/ff76684f-3ae4-4eb3-9f5b-a6ce1c79a8e4">
<h2>개발 일정(ASANA)</h2>
<img width="909" alt="스크린샷 2024-02-08 오전 10 45 11" src="https://github.com/HnG8N/web_project_subway/assets/151720731/9a8c9463-855e-4511-b3fb-a9a9996b480b">
<img width="909" alt="스크린샷 2024-02-08 오전 10 45 22" src="https://github.com/HnG8N/web_project_subway/assets/151720731/a5f83cc5-e093-46df-b26c-14af910fbd1a">
<img width="909" alt="스크린샷 2024-02-08 오전 10 45 30" src="https://github.com/HnG8N/web_project_subway/assets/151720731/6ef039e9-3484-49d3-8b2a-f8cf17d699cb">
<h2>개별 개발 현황</h2>
<h3>원도현</h3>
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
  <h4>Admin Data Flow Diagram</h4>
  <img width="968" alt="스크린샷 2024-02-08 오전 11 05 18" src="https://github.com/HnG8N/web_project_subway/assets/151720731/51b30c2a-c7d7-4ab4-b5bd-572a06967117">

<h3>김소리</h3>
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
<h3>김태우</h3>
<ul>
  <li>게시판 글 쓰기, 글 수정, 글 지우기 기능 구현</li>
  <li>글 읽기 기능
  <li>사용자 ID로 글 수정 가능</li>
  <li>페이지 구분 기능과 페이지 넘기는 기능 구현</li>
  <li>Ajax 사용으로 글 제목 검색 기능 구현</li>
  <li>댓글 및 대댓글 기능 구현</li>
</ul>
