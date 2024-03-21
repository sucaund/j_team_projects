<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hellong 고객센터</title>
</head>
<body>
<div class="breadcrumbs">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">고객센터</h1>
                </div>
            </div>
        </div>
    </div>
</div>

  <section class="faq section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2>안녕하세요, 헬롱 고객센터입니다.<br> 무엇을 도와 드릴까요?</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <span class="title">계정을 잃어버렸어요.</span><i
                                    class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>로그인 버튼을 클릭한 후 아이디 찾기를 클릭해주세요.</p>
                                <p>등록된 이메일을 입력하면 해당 이메일로 인증 번호가 전송돼요.</p>
                                <p>같은 방법으로 비밀번호 찾기 작업을 통해 비밀번호를 재설정할 수 있어요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <span class="title">결제했지만 헬스장이 등록되지 않았어요.</span><i class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>고객센터 페이지에서 일대일 문의를 클릭해주세요.</p>
                                <p>운영자가 빠르게 조치하여 정상적인 헬롱 서비스가 이루어질 수 있도록 도와드려요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <span class="title">환불을 하고 싶어요.</span><i
                                    class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>환불을 원하실 경우 마이페이지에서 결제 내역 보기를 클릭하신 후,</p>
                                <p>환불하기 버튼을 눌러주세요.</p>
                                <p>결제 후 내에 7일 이내에 환불하실 경우 결제 금액의 100%가 환불되며,</p>
                                <p>회원권에 명시된 기간 중 10% 이내에 환불 시 70%,</p>
                                <p>30% 이내에 환불 시 50%, 50% 이내에 환불 시 30%가 환불돼요.</p>
                                <p>절반을 초과하는 기간이 지났을 경우 환불하실 수 없어요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                <span class="title">사업주로서 헬롱에 헬스장을 등록하고 싶어요.</span><i
                                    class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>마이페이지, 또는 고객센터에서 비즈니스 개설/관리 버튼을 클릭해주세요.</p>
                                <p>그럼 일대일 문의 페이지에서 헬스장 등록 신청을 하실 수 있어요.</p>
                                <p>신청 글을 작성하시면, 운영자가 확인한 후 헬스장을 등록할 수 있게 도와드려요.</p>
                                <p>관리자의 승인이 이루어진 후 비즈니스 개설/관리 버튼을 다시 클릭하시면 헬스장 관리 페이지로 이동해요.</p>
                                <p>이 곳에서 헬스장에 대한 서비스, 회원 관리 및 회원에게 노출되는 홍보 페이지를 만드실 수 있어요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFive">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                <span class="title">체육관 하나 당 하나의 서비스만 존재하는 건가요?</span><i
                                    class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>아니오, 각각의 헬스장마다 다양한 서비스를 등록할 수 있어요. </p>
                                <p>헬롱 회원님들에겐 다양한 취향에 걸맞는 서비스를 제공하고, </p>
                                <p>사장님에겐 다양한 고객을 유입시켜 비즈니스에 원활한 도움이 되도록 하기 위해서에요. </p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingSix">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                <span class="title">회원을 탈퇴하고 싶어요.</span><i
                                    class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p>마이페이지에서 개인 정보 수정 페이지로 이동하면, </p>
                                <p>하단에 회원 탈퇴 버튼이 있어요. </p>
                                <p>탈퇴할 경우 계정을 다시는 복구할 수 없으므로, 신중히 생각해주세요. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section blog-section blog-list">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12 col-12" style="margin:0 auto; ">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-blog">
                            <div class="blog-content">
                                1대1 문의
                                <h4>
                                    <a style="color: #0167F3; text-decoration: underline;" href="/write_view">
                                        문의하기 </a>
                                </h4>
                                <div class="button">
                                    <a href="/authenticate" class="btn">문의 내역</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-blog">
                            <div class="blog-content">
                                공지
                                <h4>
                                    <a href="/hsListNoticeBoard" 
                                    style="text-decoration: underline; color: #00BFFD;">공지사항</a>
                                </h4>
                                   
                                <div class="button">
                                    <a href="/listGymManager" class="btn">비즈니스 개설/관리</a>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</section>


</body>
<%@ include file="../footer.jsp"%>
</html>