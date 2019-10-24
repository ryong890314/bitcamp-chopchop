<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>CHOP CHOP</title>

<!-- Stylesheet -->
<link rel="stylesheet" href="/css/style_contact.css">
<link rel="stylesheet" href="/css/style_footer.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>

  <!-- ##### Contact Area Start ##### -->
  <section class="contact-area section-padding-100">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-8 col-xl-9">
          <div class="contact-content mb-100">
            <h4 class="mb-50">CONTACT US</h4>
            <p>고객님! 무엇을 도와드릴까요? <br>
            고객님의 작은 질문까지 소중히 생각하며 고객님의 의견을 항상 열린 마음으로 수용하겠습니다. </p>

            <div class="row align-items-center mt-30 mb-50">
              <div class="col-12 col-lg-4">
                <!-- Single Contact Info -->
                <div class="single-contact-info d-flex align-items-center">
                  <div class="icon mr-15">
                    <img src="/images/placeholder.png" alt="">
                  </div>
                  <p>서울특별시 서초구 서초4동 강남대로 459</p>
                </div>

                <!-- Single Contact Info -->
                <div class="single-contact-info d-flex align-items-center">
                  <div class="icon mr-15">
                    <img src="/images/smartphone.png" alt="">
                  </div>
                  <p>02-3486-9600</p>
                </div>

                <!-- Single Contact Info -->
                <div class="single-contact-info d-flex align-items-center">
                  <div class="icon mr-15">
                    <img src="/images/message.png" alt="">
                  </div>
                  <p>chopchop@gmail.com</p>
                </div>
              </div>
              <div class="col-12 col-lg-8">
                <!-- ##### Google Maps ##### -->
                <div class="map-area">

                  <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2056330231935!2d127.02209711564676!3d37.50306793551731!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15aee9ab0cb%3A0x31793fc63e0cf9d3!2z67mE7Yq47Lqg7ZSE!5e0!3m2!1sko!2skr!4v1571134406541!5m2!1sko!2skr"
                    width="600" height="450" frameborder="0" style="border: 0;"
                    allowfullscreen=""></iframe>
                </div>
              </div>
            </div>

            <!-- Contact Form Area -->
            <div class="contact-form-area mb-70">
              <h4 class="mb-50">Get In Touch</h4>
              <p>고객님의 의견을 E-MAIL로 보내주세요.</p> 

              <form id="firstForm" onsubmit="return proceedSubmission()" action="contact" method="post" enctype="text/plain">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <input type="text" class="form-control" id="name"
                        placeholder="이름">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <input type="email" class="form-control" id="email"
                        placeholder="E-mail">
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-group">
                      <textarea name="message" class="form-control" id="message"
                        cols="40" rows="10" placeholder="문의사항을 적어주세요."></textarea>
                    </div>
                  </div>
                  <div class="col-12">
                    <button class="input-btn" type="submit">전송</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <script type="text/javascript">
    function submitForm(sub) {
      document.forms[sub].submit();
    }
    
    function proceedSubmission() {
      return confirm("이 내용을 메일로 전송하려면 확인 버튼을 클릭하세요!");
    }
  </script>

  <!-- ##### Footer Area Start ##### -->
  <jsp:include page="../footer.jsp" />

  <!-- ##### All Javascript Script ##### -->
  <!-- jQuery-2.2.4 js -->
  <script src="/js/jquery/jquery-2.2.4.min.js"></script>
  <!-- Popper js -->
  <script src="/js/bootstrap/popper.min.js"></script>
  <!-- Bootstrap js -->
  <script src="/js/bootstrap/bootstrap.min.js"></script>
  <!-- All Plugins js -->
  <script src="/js/plugins/plugins.js"></script>
  <!-- Active js -->
  <script src="/js/active.js"></script>
</body>
</html>