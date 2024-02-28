package com.oracle.hellong.controller;

import java.util.List;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.jm.JMService;
import com.oracle.hellong.service.jm.JmPaging;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JMController {

	private final JMService jm;

	private final JavaMailSender mailSender; // 이것또한 생성자 생성됨

	@RequestMapping(value = "jmListMember") // 인덱스에서 옴, 이후 jmListMember.jsp로 보내기 전..
	// get, post 둘다 받음
	public String jmListMember(Member member, Model model) {

		System.out.println("jmController Start jmListMember...");
		if (member.getCurrentPage() == null)
			member.setCurrentPage("1");

		int jmTotalMember = jm.jmTotalMember();
		System.out.println("JmController Start totalMember->" + jmTotalMember);

		// Paging 작업
		JmPaging page = new JmPaging(jmTotalMember, member.getCurrentPage());
		// Parameter emp --> Page만 추가 Setting
		member.setStart(page.getStart()); // 시작시 1
		member.setEnd(page.getEnd()); // 시작시 10

		List<Member> jmListMember = jm.jmListMember(member);
		System.out.println("JmController jmListMember jmListMember.size()=>" + jmListMember.size());

		model.addAttribute("jmTotalMember", jmTotalMember);
		model.addAttribute("jmListMember", jmListMember);
		model.addAttribute("page", page);
		// 결국 이 3개를 jsp에 보내기 위함

		return "jm/jmListMember";
		// 이후 html로 보냄
	}
	@RequestMapping(value = "jmListMemberReal")
		public String jmListMemberReal(Member member, Model model) {

			System.out.println("jmController Start jmListMemberReal...");
			if (member.getCurrentPage() == null)
				member.setCurrentPage("1");
				System.out.println(member.getCurrentPage()); //첫시작은 1

			int jmTotalMember = jm.jmTotalMemberReal(); //이걸 바꿔줘야..
			System.out.println("JmController Start totalMemberReal->" + jmTotalMember);

			// Paging 작업
			JmPaging page = new JmPaging(jmTotalMember, member.getCurrentPage());
			// Parameter emp --> Page만 추가 Setting
			member.setStart(page.getStart()); // 시작시 1
			member.setEnd(page.getEnd()); // 시작시 10

			List<Member> jmListMember = jm.jmListMemberReal(member);
			System.out.println("JmController jmListMemberReal jmListMember.size()=>" + jmListMember.size());

			model.addAttribute("jmTotalMemberReal", jmTotalMember);
			model.addAttribute("jmListMemberReal", jmListMember);
			model.addAttribute("page", page);
			// 결국 이 3개를 jsp에 보내기 위함

			return "jm/jmListMemberReal";
			// 이후 html로 보냄
		}
	

	// 멤버 조회시, 입력한 number와 동일한 member 가져옴
	@RequestMapping(value = "jmDetailMember")
	public String jmDetailMember(Member member1, Model model) {
		System.out.println("JmController Start jmDetailMember...");
		Member member = jm.jmDetailMember(member1.getM_number());
		model.addAttribute("member", member);
		// 이걸 보내기 위함. 보내기 전 작업은 컨트롤러->서비스->dao로 처리하고
		return "jm/jmDetailMember";
	}

	// 멤버 정보 수정
	@RequestMapping(value = "jmUpdateMemberForm")
	public String jmUpdateMemberForm(Member member1, Model model) {
		System.out.println("JmController Start jmUpdateMemberForm...");
		//
		Member member = jm.jmDetailMember(member1.getM_number());
		System.out.println("member.getM_name()->" + member.getM_name());
		System.out.println("emp.getHiredate()->" + member.getM_regdate());
		model.addAttribute("member", member);
		return "jm/jmUpdateMemberForm";
	} // 멤버 수정 폼으로 이동

	// updateForm에 넣은 것 순수 Update
	@RequestMapping(value = "jmUpdateMember")
	public String jmUpdateMember(Member member1, Model model) {
		// member1 : jmUpdateMemberForm 에서의 선택된 Member
		log.info("jmUpdateMember Start...");

		int updateCount = jm.jmUpdateMember(member1);
		System.out.println("jmController jmUpdateMember updateCount-->" + updateCount);
		// 수정

		// 수정 후 수정한 member의 jmDetailMember.jsp로 이동하려면..
		Member member = jm.jmDetailMember(member1.getM_number());
		model.addAttribute("member", member);
		return "forward:jmDetailMember";
		// 업데이트 후 그 멤버의 detail 화면으로 즉시 이동
	}

	@RequestMapping(value = "jmSignUpForm") // 폼으로 이동시킴
	public String jmSignUpForm(Model model) {
		System.out.println("jmController jmSignUpForm Start...");
		return "jm/jmSignUpForm"; // 이 페이지에서 정보입력
	}

	// validation:객체의 제약 조건 참조시
	// insert : 쓰는 작업 : 회원가입
	@RequestMapping(value = "jmSignUp") // 입력한 정보 순수 insert하는 작업 수행
	public String jmSignUp(@ModelAttribute("member") @Valid Member member, BindingResult result, Model model) {
		System.out.println("jmController jmSignUp Start...");

		// validation 오류시 result
		if (result.hasErrors()) {
			System.out.println("jmController jmSignUp hasErrors..");
			model.addAttribute("msg", "BindingResult 입력 실패. 확인해보세요");
			return "forward:jmSignUpForm";
		}
		// service, dao, mapper명(insertEmp)까지->insert
		int insertResult = jm.jmInsertMember(member);
		if (insertResult > 0) {
			return "redirect:jmListMember"; // 가입성공시
			// redirect나 foward:같은 컨트롤러 안에 매핑한 메서드로 이동하는 것..
			// redirect는 단순 이동
			// forward는 model.addAttribute로 지정한걸 데리고 가는거고
			// 그래서 로그인이 필요한 화면에 들어갔을 때 사용하기 적합
			// 반드시 로그인이 필요하다면 로그인 페이지로 forward 시키는 식
		} else {
			System.out.println("jmController jmSignUp insertResult->" + insertResult);
			model.addAttribute("msg", "가입 실패. 가입 화면으로 되돌아갑니다");
			return "forward:jmSignUpForm";
		}

	}

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
	
	
	@RequestMapping(value = "jmSignUpFormAjax") // 폼으로 이동시킴
	public String jmSignUpFormAjax(Model model) {
		System.out.println("jmController jmSignUpFormAjax Start...");
		return "jm/jmSignUpFormAjax"; // 이 페이지에서 정보입력
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

	// 실제 멤버 db에서 멤버 행 삭제 (권장 x, 테스트용)
	@RequestMapping(value = "jmDeleteMemberReal")
	public String jmDeleteMember(Member member, Model model) {
		System.out.println("jmController Start jmDeleteMemberReal...");
		int result = jm.jmDeleteMemberReal(member.getM_number());
		return "redirect:jmListMember";
	}

	@RequestMapping(value = "jmDeleteMemberFake")
	public String jmDeleteMemberFake(Member member1, Model model) {
		// member1 : jmUpdateMemberForm 에서의 선택된 Member
		log.info("jmDeleteMemberFake Start...");

		int deleteCount = jm.jmDeleteMemberFake(member1);
		System.out.println("jmController jmDeleteMemberFake deleteCount-->" + deleteCount);
		// 수정

		// 수정 후 수정한 member의 jmDetailMember.jsp로 이동하려면..
		Member member = jm.jmDetailMember(member1.getM_number());
		model.addAttribute("member", member);
		return "forward:jmDetailMember";
		// 업데이트 후 그 멤버의 detail 화면으로 즉시 이동
	}

//
//	@GetMapping(value = "listEmpDept")
//	public String listEmpDept(Model model) {
//		System.out.println("EmpController listEmpDept Start...");
//		// service, dao ->listEmpDEpt
//		// Mapper만->tkListEmpDept
//		List<EmpDept> listEmpDept = es.listEmpDept();
//		model.addAttribute("listEmpDept", listEmpDept);
//		return "listEmpDept";
//
//	}
//
	@RequestMapping(value = "jmMailTransport")
	public String mailTransport(HttpServletRequest request, Model model) {
		System.out.println("mailSending..");
		String tomail = "ujm1jaman@gmail.com"; // 받는사람 이메일
		System.out.println(tomail);
		String setfrom = "woakswoaks@gmail.com"; // 보내는사람 이메일
		String title = "mailTransport입니다"; // 제목
		try {
			// Mime : 전자우편 인터넷 표준 format
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정삭자동하지않음
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략 가능함
			String tempPassword = (int) (Math.random() * 999999) + 1 + "";
			messageHelper.setText("임시비밀번호입니다" + tempPassword); // 메일 내용
			System.out.println("임시 비밀번호입니다:" + tempPassword);
			mailSender.send(message);
			model.addAttribute("check", 1); // 정상 전달
			// 이 아래에는 db logic 구성이 들어가야한다.
		} catch (Exception e) {
			System.out.println("mailTransport e.getMessage()" + e.getMessage());
			model.addAttribute("check", 2);
		}
		return "jm/jmMailResult";
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
//	@ResponseBody
//	@RequestMapping(value = "getDeptName")
//	public String getDeptName(Dept dept, Model model) {
//		System.out.println("deptno" + dept.getDeptno());
//		String deptName = es.deptName(dept.getDeptno());
//		System.out.println("deptName->" + deptName);
//		return deptName;
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "empListUpdate")
//	public Map<String, Object> empListUpdate(@RequestBody @Valid List<Emp> listEmp) {
//		System.out.println("EmpController empListUpdate Start...");
//		int updateResult = 1;
//
//		for (Emp emp : listEmp) {
//			System.out.println("EmpController empListUpdate emp->" + emp);
//		}
//		// int writeResult = kkk.lisrUpdateEmp(emp);
//		// String followingProStr = Integer.toString(followingPro);
//
//		System.out.println("EmpController empListUpdate writeResult -> " + updateResult);
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("updateResult", updateResult);
//		return resultMap;
//	}
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
