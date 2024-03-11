package com.oracle.hellong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.jm.JMService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JMController {

	private final JMService jm;


	// 회원가입시 id 중복 체크 목적 : m_id를 기반으로 member 가져옴
	@RequestMapping(value = "jmConfirmMemberId")
	public String jmConfirmMemberId(Member member1, Model model) {
		Member member = jm.jmGetMemberFromId(member1.getM_id());
		model.addAttribute("m_id", member1.getM_id());
		if (member != null) { // 입력한 m_id와 같은 member가 있다면
			System.out.println("jmController jmConfirmMemberId 중복된 m_id");
			model.addAttribute("msg", "중복된 아이디입니다");
			return "forward:jmSignUpForm";
		} else {
			System.out.println("jmController jmConfirmMemberId 사용 가능한 m_id");
			model.addAttribute("msg", "사용 가능한 아이디입니다");
			return "forward:jmSignUpForm";
		}
	}
	
	

	@ResponseBody // ajax 회원가입시 아이디 체크 (사용하는 것)
	@RequestMapping(value = "jmConfirmMemberIdAjax2")
	public int jmConfirmMemberIdAjax2(@RequestParam("m_id") String m_id) {
		System.out.println("jmController jmConfirmMemberIdAjax2 Start...");
		if (m_id == null || m_id == "")
			return -1;
		else
			return jm.checkId(m_id); //isDeleted=0인것만
	}			//스트링을 보내서 인트를 받아옴
	
	@ResponseBody // 비밀번호 재설정 시 중복 비밀번호 찾기
	@RequestMapping(value = "jmConfirmMemberPw")
	public String jmConfirmMemberPw(@RequestParam(value="m_pw",required=false) String m_pw, HttpSession session) {
		System.out.println("jmController jmConfirmMemberPw Start...");
		System.out.println("jmControllerjmConfirmMemberPw m_pw"+m_pw);
		int m_number=0;
		if(session.getAttribute("findM_number")!=null) {
			m_number=(int)session.getAttribute("findM_number");
		} else {m_number=(int)session.getAttribute("m_number");}

		System.out.println("jmControllerjmConfirmMemberPw m_number"+m_number);
		String result=jm.checkPwDuple(m_number, m_pw); //isDeleted=0인것만
		//중복일 시 duple, 중복이 아닐 때 ok, 오류시 error
		System.out.println("jmController jmConfirmMemberPw result:"+result);
		return result;
	}
	

	@RequestMapping(value = "jmSignUpFormAjax2") // 회원가입 폼으로 이동시킴
	public String jmSignUpFormAjax2() {
		System.out.println("jmController jmSignUpFormAjax Start...");
		return "jm/jmSignUpFormAjax2"; // 이 페이지에서 정보입력
	}

	@RequestMapping(value = "jmSignUpAjax2") // 입력한 정보 순수 insert하는 작업 수행
	public String jmSignUpAjax2(@ModelAttribute("member") @Valid Member member, BindingResult result) {
		System.out.println("jmController jmSignUpAjax2 Start...");

		// validation 오류시 result
		if (result.hasErrors()) {
			System.out.println("jmController jmSignUpAjax hasErrors..");
			return "forward:jmSignUpFormAjax2";
		}
		// service, dao, mapper명(insertEmp)까지->insert
		int insertResult = jm.jmInsertMember(member);
		if (insertResult > 0) {
			return "redirect:jmSignUpCorrect"; // 가입성공시
			// redirect나 foward:같은 컨트롤러 안에 매핑한 메서드로 이동하는 것..
			// redirect는 단순 이동
			// forward는 model.addAttribute로 지정한걸 데리고 가는거고
			// 그래서 로그인이 필요한 화면에 들어갔을 때 사용하기 적합
			// 반드시 로그인이 필요하다면 로그인 페이지로 forward 시키는 식
		} else {
			System.out.println("jmController jmSignUpAjax2 insertResult->" + insertResult);
			return "forward:jmSignUpFormAjax2";
		}

	}

	@RequestMapping(value = "jmSignUpCorrect")
	public String jmSignUpCorrect() {
		System.out.println("jmController jmSignUpCorrect Start...");
		return "jm/jmSignUpCorrect"; // 이 페이지에서 정보입력
	}

	@RequestMapping(value = "jmLoginForm") // 로그인 폼으로 이동시킴
	public String jmLoginForm() {
		System.out.println("jmController jmLoginForm Start...");
		return "jm/jmLoginForm"; //
	}

	@RequestMapping("jmLoginCheck")
	public String jmLoginCheck(@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw, Member member,
			HttpSession session, Model model) {
		System.out.println("jmController jmLoginCheck start");
		int result = jm.jmLogin(m_id, m_pw); // m_name, 즉 이름. 일단은.. -> 잘불러와지는거 확인했으므로 *로 변경
		System.out.println("jmController jmLoginCheck result:" + result);
		if (result == 1) { // 아이디, 비번 모두 일치 시...
			System.out.println("jmController jmLoginCheck 로그인 성공");
			member = jm.jmGetMemberFromId(m_id); // m_id 같은 member 전체 가져옴
			session.setAttribute("m_number", member.getM_number());
			System.out.println("member.getM_number()" + member.getM_number());
			session.setAttribute("m_id", member.getM_id());
			System.out.println("member.getM_id()" + member.getM_id());
			session.setAttribute("m_name", member.getM_name());
			System.out.println("member.getM_name()" + member.getM_name());
			
			session.setAttribute("member_common_bcd", member.getCommon_bcd());
			System.out.println("member_common_bcd" + member.getCommon_bcd());
			session.setAttribute("member_common_mcd", member.getCommon_mcd());
			System.out.println("member_common_mcd" + member.getCommon_mcd());
			// 이렇게 끌어올 거는 내 자유? 갖다 쓸거?
			System.out.println(session);
			// 세션 유지기간 30분
			session.setMaxInactiveInterval(60 * 30);
			return "jm/jmMainPage"; //근데 일로 리턴시켜도 주소는 계속 jmLoginForm을 유지...
			//어차피 로그인하면 그 전 화면으로 움직여야 하는데.
		} else {
			System.out.println("jmController jmLoginCheck 아이디나 비밀번호가 일치하지 않습니다");
			model.addAttribute("msg", "jmController jmLoginCheck 아이디나 비밀번호가 일치하지 않습니다");
			return "jm/jmLoginForm";
		}
	}

	// 로그아웃
	@RequestMapping("jmLogOut")
	public String jmLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 메인페이지
	@RequestMapping("jmMainPage")
	public String jmMainPage() { //세션 인자로 안넣어줘도 세션 제대로 유지해 받는다.
		return "jm/jmMainPage";
	}

	// 마이페이지
	@RequestMapping("jmMyPage")
	public String jmMyPage(HttpSession session, Model model) {
		if(session.getAttribute("m_id")!=null) { //세션에 등록되어있을때=로그인했을때
			Member member=new Member();
			member=jm.jmGetMemberFromId((String)session.getAttribute("m_id"));
			//member에서 등록헬스장, 찜한 헬스장 몇개, 현재 서비스, 현재 서비스 기간, 현재 서비스 가격,
			// 작성글 몇개, 스크랩 몇개, 현재 포인트, 결제내역 가져오고
			model.addAttribute("member", member);
			//나머지는 페이지에서 링크로..
			//null일 때 msg같은거 보냄 
			//몇개씩 보내는건 ListMember 참고해서 보내면 될 것 같은데. List 보내는 식
//			session.getAttribute(null)
			System.out.println(member.getM_gender());
		return "jm/jmMyPage";
		} else { //로그인 되지 않았을 때
			return "forward:jmLoginForm";
		}
	}

	// 아이디 찾기 폼
	@RequestMapping("jmFindIdForm")
	public String jmFindIdForm() {
		System.out.println("jmController jmFindIdForm");
		return "jm/jmFindIdForm";
	}
	

	// 비밀번호 찾기 폼
	@RequestMapping("jmFindPwForm")
	public String jmFindPwForm() {
		System.out.println("jmController jmFindPwForm");
		return "jm/jmFindPwForm";
	}
	
	// 비밀번호 찾기에서, 사용자가 입력한 id와 email을 바탕으로 계정 찾는 작업 수행
	@RequestMapping(value = "jmFindPw")
	public String jmFindPw(@RequestParam("m_id") String m_id, @RequestParam("m_email") String m_email, HttpSession session) {
		System.out.println("jmController jmFindPw Start...");
		System.out.println(m_id);
		System.out.println(m_email);
		int findM_number = jm.jmGetM_numberFromIdAndEmail(m_id, m_email);
		System.out.println("jmController jmFindPw findM_number: "+findM_number); //여기까지 성공
		session.setAttribute("findM_number", findM_number);
		if (findM_number >0) { // 가입된 계정 찾음
			System.out.println("jmController jmFindPw findM_number "+findM_number);
			return "jm/jmResetPwForm"; //return "jm/"은 jsp로 이동시키는것, Model model 없이도 됨
			//return "forward:jmSignUpFormAjax2"; 이거는 컨트롤러로 이동시키는걸 의미하고.
		} else { //해당 아이디-이메일과 일치하는 계정이 없다면, 0이 리턴됨
			return "jm/jmFindPwFail"; //따로 매핑 없이 즉시 이동 가능
			//다시 말해 매핑을 쓰는 이유는 1. 세션이나 모델 사용 2. 컨트롤러에서 작업수행
			//3.컨트롤러 하나 만들어놓고 추후 링크 변화같은건 컨트롤러 안에서 변경하는 목적이지,
			//단순 이동이라면 따로 뺄 필요가 없는 듯 싶은데..
			//아니 그래도, 주소창에 뜨는 링크 규격화를 위해서라도 하긴 해야하는듯.
			//오류 나기도 하고. 즉 컨트롤러 없이 링크 걸면 jm/여기로 안가고, 링크를 못찾는다.
			//특히 폴더 안에 넣는다던가 하면. 일단 주소에 표현되는 /표기는 컨트롤러의 매핑을 받는다.
		}
	}
	
	@RequestMapping(value="jmResetPwForm") //회원정보수정에서 비밀번호 찾기 눌렀을 때
	//즉 findPw 거치지 않고 jmResetPwForm이 리턴시키는 jsp를 지정하기 위함
	public String jmResetPwForm() {
		return "jm/jmResetPwForm";
	}
	
		//비밀번호 재설정
	  @RequestMapping(value = "jmResetPw") //클릭 눌렀을 때
	  public String jmFindPw(@RequestParam("m_pw") String m_pw, HttpSession session) {
	  System.out.println("jmController jmResetPw start..");
	  System.out.println("jmController jmResetPw pw: "+m_pw); 
	  int m_number=0;
	  if(session.getAttribute("findM_number")!=null) { //비밀번호 찾기에서 들어왔을 때
		  System.out.println(session.getAttribute("findM_number")); //여기까지 정상적으로 끌어와짐
		  m_number=(int)session.getAttribute("findM_number");
	  } else if (session.getAttribute("findM_number")==null) { //회원정보 수정에서 비밀번호 변경 클릭해 
		  //findM_number라는 세션이 존재하지 않을 때
		  m_number=(int)session.getAttribute("m_number");
	  }
	  System.out.println(m_number);
	  System.out.println("jmController jmResetPw m_number"+m_number);
	  int resetResult=jm.jmResetPw(m_number, m_pw);
	  System.out.println("jmController jmResetPw resetResult"+resetResult);
		if (resetResult > 0) { //1이면 업데이트 성공
			return "redirect:jmResetPwCorrect";
		} else {
			System.out.println("jmController jmSignUpAjax2 resetResult->" + resetResult);
			System.out.println("비밀번호 재설정 실패" );
			return "forward:jmResetPw";

		}	  
	  }

	  //재설정 완료->로그아웃해 재 로그인 하게
		@RequestMapping(value = "jmResetPwCorrect")
		public String jmResetPwCorrect(HttpSession session) {
			System.out.println("jmController jmResetPwCorrect Start...");
			session.invalidate();
			return "jm/jmResetPwCorrect"; 
		}
	 

	// 내 정보 눌렀을 때 나오는 회원정보 수정 페이지
	@RequestMapping(value = "jmUpdateMemberForm")
	public String jmUpdateMemberForm(Model model, HttpSession session) {
		System.out.println("jmController jmUpdateMemberForm Start...");
		if (session.getAttribute("m_number") != null) {
			int m_number= (int)session.getAttribute("m_number");
			Member member=new Member();
			member=jm.jmGetMemberFromNumber(m_number);
			System.out.println("jmController jmUpdateMemberForm 로그인 되었음");
			model.addAttribute("member",member);
			return "jm/jmUpdateMemberForm";
		} else {
			System.out.println("로그인되지 않았음. 로그인 화면으로 이동합니다..");
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			return "jm/jmLoginForm";
		}
	}
	
	// updateForm에 넣은 것 순수 Update
		@RequestMapping(value = "jmUpdateMember")
		public String jmUpdateMember(@ModelAttribute("member") @Valid Member member, HttpSession session,Model model) {
			// member1 : jmUpdateMemberForm 에서의 선택된 Member
			
			System.out.println(member);
			member.setM_number((int)session.getAttribute("m_number"));
			int updateCount = jm.jmUpdateMember(member);
			System.out.println("jmController jmUpdateMember updateCount-->" + updateCount);
			// 수정

			return "forward:jmUpdateMemberForm";
			// 업데이트 후 그 멤버의 detail 화면으로 즉시 이동
		}	
	
	//마이페이지에서 회원 탈퇴 눌렀을 때 회원탈퇴 폼으로 이동하는 컨트롤러
	@RequestMapping(value = "jmWithdrawalMemberForm")
	public String jmWithdrawalMemberForm(HttpSession session) {
		System.out.println("jmController jmWithdrawalMemberForm");
		System.out.println(session.getAttribute("m_number"));
		if (session.getAttribute("m_number") != null) { //로그인되어있을때
		return "jm/jmWithdrawalMemberForm"; 
		} else {
			return "jm/jmLoginForm";
		}
	}
	
	//마이페이지에서 회원 탈퇴 눌렀을 때 회원탈퇴 폼으로 이동하는 컨트롤러
	@RequestMapping(value = "jmWithdrawalMemberPwCheckForm")
	public String jmWithdrawalMemberPwCheckForm(HttpSession session) {
		System.out.println("jmController jmWithdrawalMemberPwCheckForm");
		System.out.println(session.getAttribute("m_number"));
		if (session.getAttribute("m_number") != null) { //로그인되어있을때
		return "jm/jmWithdrawalMemberPwCheckForm"; 
		} else {
			return "jm/jmLoginForm";
		}
	}
	
	//회원탈퇴 시 입력한 확인비밀번호가 일치하는지 작업 수행
	@RequestMapping(value = "jmWithdrawalMemberPwCheck")
	public String jmWithdrawalMemberPwCheck(@RequestParam("m_pw") String m_pw,HttpSession session) {
		System.out.println("jmController jmWithdrawalMemberPwCheck");
		System.out.println(session.getAttribute("m_number"));
		int m_number=(int)session.getAttribute("m_number");
		if (session.getAttribute("m_number") != null) { //로그인되어있을때
			
			String result=jm.checkPwDuple(m_number, m_pw); //isDeleted=0인것만
			//중복일 시 duple, 중복이 아닐 때 ok, 오류시 error
			
			if(result=="duple") { //중복일 때 = 비밀번호가 일치할 때
				return "forward:jmWithdrawalMember";
					} else if(result=="ok") { //중복이 아닐 때=비밀번호가 일치하지 않을 때
						return "jm/jmWithdrawalMemberPwCheckFail";
					} else {
						return "jm/jmErrorPage";
					}
		} else { //m_number가 null일때 : 로그인되어있지 않을 떄
			return "jm/jmLoginForm";
		}
	}
	
	
	//회원탈퇴 폼에서 비밀번호 인증 후 탈퇴 작업 수행하는 컨트롤러
	@RequestMapping(value = "jmWithdrawalMember")
	public String jmWithdrawalMember(HttpSession session, Model model) {
		System.out.println("jmController jmWithdrawalMember Start...");
		int m_number=(int)session.getAttribute("m_number");
		Member member=new Member();
		member.setM_number(m_number);
		int deleteCount = jm.jmDeleteMemberFake(member);
		System.out.println("jmController jmDeleteMemberFake deleteCount-->" + deleteCount);
		// 수정

		if(deleteCount==1) {
			System.out.println("jmController jmWithdrawalMember 회원 탈퇴 성공");
		return "forward:jmWithdrawalMemberSuccess"; 
		} else {
			System.out.println("jmController jmWithdrawalMember 회원 탈퇴 실패");
			return "jm/jmWithdrawalMemberFail";
		}
		
	}
	
	//탈퇴 작업 실패
	@RequestMapping(value = "jmWithdrawalMemberFail")
	public String jmWithdrawalMemberFail() {
		System.out.println("jmController jmWithdrawalMemberFail start..");
		return "jm/jmWithdrawalMemberFail";
	}
	
	//탈퇴 작업 성공
	@RequestMapping(value = "jmWithdrawalMemberSuccess")
	public String jmWithdrawalMemberSuccess(HttpSession session) {
		System.out.println("jmController jmWithdrawalMemberSuccess");
		session.invalidate();
		return "jm/jmWithdrawalMemberSuccess";
	}
	 

	// 관리자전용페이지. 세션 테스트용
	@RequestMapping("jmMasterPage")
	public String jmMasterPage(Model model, HttpSession session) {
		System.out.println("jmController jmMasterPage");
		if (session.getAttribute("m_id") != null) {
			if ((int) session.getAttribute("member_common_mcd") == 30) {
				System.out.println(session.getAttribute("member_common_mcd"));
				System.out.println("로그인되었고 관리자 계정임");
				model.addAttribute("msg", "로그인되었고 관리자계정임");
				return "jm/jmMasterPage";
			} else {
				System.out.println("로그인되었으나 관리자 계정이 아님");
				model.addAttribute("msg", "로그인되었으나 관리자 계정이 아님");
				System.out.println(session.getAttribute("member_common_mcd"));
				return "redirect:/jmMainPage";
			}
		} else {
			System.out.println("로그인되지 않았음. 로그인 화면으로 이동합니다..");
			model.addAttribute("msg", "로그인되었으나 관리자 계정이 아님, 메인페이지로 이동합니다");
			return "jm/jmLoginForm";
		}
	}

//	//가입/수정 시 이름 체크(중복 체크만)
//	@RequestMapping(value = "jmConfirmMemberName")
//	public String jmConfirmMemberName(Member member1, Model model) {
//		Member member = jm.jmConfirmMemberName(member1.getM_name());
//		model.addAttribute("m_name", member1.getM_name());
//		if (member != null) { // 입력한 m_id와 같은 member가 있다면
//			System.out.println("jmController jmConfirmMemberName 중복된 m_name");
//			model.addAttribute("msg", "중복된 아이디입니다");
//			return "forward:jmSignUpForm";
//		} else {
//			System.out.println("jmController jmConfirmMemberName 사용 가능한 m_name");
//			model.addAttribute("msg", "사용 가능한 닉네임입니다");
//			return "forward:jmSignUpForm";
//
//		}
//
//	}


	@ResponseBody //모든 이메일 인증에 사용
	@RequestMapping(value = "jmMailCheck", method = RequestMethod.POST)
	public String jmMailCheck(@RequestParam("m_email") String m_email) {
		System.out.println("jmMailCheck..");
		int number = jm.sendMail(m_email); // 인증번호
		String num = "" + number;
		System.out.println(num);
		return num; // 즉 메일을 보내서 인증번호를 받는 꼴

	}
	
	 
	    @ResponseBody
	    @RequestMapping(value = "jmFindIdWithMail", method = RequestMethod.POST)
	    public String jmFindIdWithMail(@RequestParam("mail") String mail, HttpSession session) {
	        
		 System.out.println("jmController jmFindIdWithMail ajax에서 받은 mail: "+mail);
		 
		 String getIdFromMail=jm.jmGetIdFromMail(mail); //이메일로 가져온 아이디
		 
		 
	        if (getIdFromMail!=null) { //아이디를 가져오는데에 성공했을 경우
	            System.out.println("jmController jmFindIdWithMail 해당 이메일로 가입된 아이디는 "+getIdFromMail);
	            // 값이 같을 경우 입력값과 true를 반환
	            
	            session.setAttribute("getIdFromMail", getIdFromMail);
	            return mail+"로 등록된 아이디는 \n"+getIdFromMail+"입니다.";
	        } else { 
	            System.out.println("jmController jmFindIdWithMail 해당 이메일로 가입된 아이디가 없음");
	            return mail+"로 등록된 아이디가 없습니다."; 
	        }
	    }
	 



	 


//
//	// interCeptor 시작화면
//	@RequestMapping(value = "interCeptorForm")
//	public String interCeptorForm(Model model) {
//		System.out.println("interCeptorForm Start");
//		return "interCeptorForm";
//	}
//
//	@RequestMapping(value = "interCeptor")
//	// public String interCeptor(Member1 member, Model model) {
//	public void interCeptor(Member1 member1, Model model) {
//		System.out.println("EmpController interCeptor Test Start");
//		System.out.println("EmpController interCeptor id->" + member1.getId());
//		// 존재:1 비존재:0
//		int memCnt = es.memCount(member1.getId());
//
//		System.out.println("EmpController interCeptor memCnt->" + memCnt);
//		model.addAttribute("id", member1.getId());
//		model.addAttribute("memCnt", memCnt);
//		System.out.println("interCeptor Test End");
//		// return "interCeptor"; //user 존재하면 user 이용 조회 page
//		return;
//	}
//
//	// sampleInterceptor 내용 받아 처리
//	@RequestMapping(value = "doMemberWrite", method = RequestMethod.GET)
//	public String doMemberWrite(Model model, HttpServletRequest request) {
//		String ID = (String) request.getSession().getAttribute("ID");
//		System.out.println("doMemberWrite부터 하세요");
//		model.addAttribute("id", ID);
//		return "doMemberWrite";
//	}
//
//	// interCeptor 진행 Test
//	@RequestMapping(value = "doMemberList")
//	public String doMemberList(Model model, HttpServletRequest request) {
//		String ID = (String) request.getSession().getAttribute("ID");
//		System.out.println("doMemberList Test Start Id->" + ID);
//		Member1 member1 = null;
//		// Member List Get Service
//		List<Member1> listMem = es.listMem(member1);
//		model.addAttribute("ID", ID);
//		model.addAttribute("listMem", listMem);
//		return "doMemberList";
//	}
//


//
//	@ResponseBody
//	@RequestMapping(value = "transactionInsertUpdate")
//	public String transactionInsertUpdate(Emp emp, Model model) {
//		System.out.println("EmpController transactionInsertUpdate Start...");
//		// member Insert 성공 과 실패
//		int returnMember = es.transactionInsertUpdate();
//		System.out.println("EmpController transactionInsertUpdate returnMember=>" + returnMember);
//		String returnMemberString = String.valueOf(returnMember);
//
//		return returnMemberString;
//
//	}

}
