package com.oracle.hellong.service.jm;

import java.util.List;

import java.util.List;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.hellong.dao.jmdao.JmMemberDao;
import com.oracle.hellong.model.Member;

import jakarta.mail.internet.MimeMessage;
import jakarta.validation.Valid;

//import com.oracle.hellong.model.Emp;
//import com.oracle.hellong.model.EmpDept;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional // jpa에서 사용
public class JMServiceImpl implements JMService {

	private final JmMemberDao jmmd;
	private final JavaMailSender mailSender;
	private static int authNumber;

	@Override
	public int jmTotalMember() { // 전체수 구하기
		System.out.println("JmServiceImpl Start jmTotalMember...");
		int totalMemberCount = jmmd.jmTotalMember();
		System.out.println("JmServiceImpl totalMember totMemCnt->" + totalMemberCount);
		return totalMemberCount;
	}
	
	@Override
	public int jmTotalMemberReal() { // 전체수 구하기
		System.out.println("JmServiceImpl Start jmTotalMember...");
		int totalMemberCount = jmmd.jmTotalMemberReal();
		System.out.println("JmServiceImpl totalMember totMemCnt->" + totalMemberCount);
		return totalMemberCount;
	}
	
	
	

	@Override
	public List<Member> jmListMember(Member member) {
		List<Member> memberList = null; //리스트 뿌려주기
		System.out.println("JmServiceImpl jmListMember Start...");
		memberList = jmmd.jmListMember(member);
		System.out.println("JmServiceImpl jmListMember memberList.size()->" + memberList.size());
		return memberList;
	}
	
	
	@Override
	public List<Member> jmListMemberReal(Member member) {
		List<Member> memberList = null; //리스트 뿌려주기
		System.out.println("JmServiceImpl jmListMemberReal Start...");
		memberList = jmmd.jmListMemberReal(member);
		System.out.println("JmServiceImpl jmListMemberReal memberList.size()->" + memberList.size());
		return memberList;
	}



	@Override
	//m_number를 기반으로 Member 가져옴
	public Member jmGetMemberFromNumber(int m_number) {
		System.out.println("JmServiceImpl jmGetMemberFromNumber...");
		Member member = null;
		member = jmmd.jmGetMemberFromNumber(m_number);
		return member;
	}

	@Override
	public int jmUpdateMember(Member member) {
		//회원정보 수정
		System.out.println("JmServiceImpl jmUpdateMember ...");
		int updateCount = 0;
		updateCount = jmmd.jmUpdateMember(member);
		return updateCount;
	}


	@Override
	public int jmInsertMember(@Valid Member member) {
		int result = 0;
		System.out.println("jmServiceImpl jmInsertMember Start..." );
		result = jmmd.jmInsertMember(member);
		return result;
	}
	
	//m_id가 같은 멤버를 가져옴, 회원가입시 아이디 중복체크용. 
	public Member jmGetMemberFromId(String m_id) {
		System.out.println("JmServiceImpl jmGetMemberFromId...");
		Member member = null;
		member = jmmd.jmGetMemberFromId(m_id);
		return member;
	}

	@Override
	public int jmDeleteMemberReal(int m_number) {
		int result = 0;
		System.out.println("JmServiceImpl jmDeleteMemberReal Start..." );
		result =  jmmd.jmDeleteMemberReal(m_number);
		return result;
	}

	@Override
	public int jmDeleteMemberFake(Member member) {
		System.out.println("JmServiceImpl jmDeleteMemberFake ...");
		int deleteCount = 0;
		deleteCount = jmmd.jmDeleteMemberFake(member);
		return deleteCount;
	}

	@Override
	public int checkId(String m_id) {
		System.out.println("JmServiceImpl checkId ...");
		int checkIdCount=0;
		checkIdCount=jmmd.jmCheckId(m_id);
		return checkIdCount;
	}

	@Override
	public int sendMail(String mail) {
		System.out.println("sendMail..");
		System.out.println(mail);
		String setfrom = "woakswoaks@gmail.com"; // 보내는사람 이메일
		String title = "Hellong 인증 이메일입니다"; // 제목
		
		try {
			// Mime : 전자우편 인터넷 표준 format
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정삭자동하지않음
			messageHelper.setTo(mail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략 가능함
			authNumber = (int) (Math.random() * 999999) + 1;
			messageHelper.setText("Hellong 인증번호입니다.\n" + authNumber); // 메일 내용
			System.out.println("Hellong 인증번호입니다: " + authNumber);
			mailSender.send(message);
//			model.addAttribute("check", 1); // 정상 전달

		} catch (Exception e) {
			System.out.println("sendMail e.getMessage()" + e.getMessage());
//			model.addAttribute("check", 2);
		}
		return authNumber;
	}

	@Override
	public int jmLogin(String m_id, String m_pw) {
		System.out.println("jmServiceImpl jmLogin");
		return jmmd.jmLogin(m_id, m_pw);
	}


	@Override
	public String jmGetIdFromMail(String mail) {
		System.out.println("JmServiceImpl getIdFromMail mail "+mail);
		String id = null;
		id = jmmd.jmGetIdFromMail(mail);
		System.out.println("JmServiceImpl getIdFromMail id "+id);
		return id;
	}

	@Override
	public int jmGetM_numberFromIdAndEmail(String m_id, String m_email) {
		System.out.println("JmServiceImpl jmGetM_numberFromIdAndEmail..."+m_id+" "+ m_email);
		int m_number = 0;
		m_number = jmmd.jmGetM_numberFromIdAndEmail(m_id, m_email);
		return m_number;
	}

	@Override
	public String checkPwDuple(int m_number, String m_pw) {
		System.out.println("JmServiceImpl checkPwDuple ...");
		System.out.println(m_number+" "+m_pw);
		String checkPw=null;
		checkPw=jmmd.jmCheckPwDuple(m_number, m_pw);
		return checkPw;
	}

	@Override
	public int jmResetPw(int m_number, String m_pw) {
		System.out.println("JmServiceImpl jmResetPw start.. ...");
		System.out.println(m_number+" "+m_pw);
		int resetPwCheck=0;
		resetPwCheck=jmmd.jmResetPw(m_number, m_pw);
		return resetPwCheck;
	}






}
