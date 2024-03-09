package com.oracle.hellong.dao.jmdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JmMemberDaoImpl implements JmMemberDao {

	// mybatis db 연동
	private final SqlSession session;

	@Override
	public int jmTotalMember() { //총 멤버수
		int totalMemberCount = 0;
		System.out.println("JmMemberDaoImpl Start jmTotalMember...");

		try { // 매퍼 사용. yml -> mappers/Emp->네임스페이스.select id
			totalMemberCount = session.selectOne("com.oracle.hellong.MemberMapper.jmMemberTotal");
			//null이 아니라 0으로 찾긴 찾았는데.. -> 데이터 넣고 커밋을 안해서 
			System.out.println("JmMemberDaoImpl jmTotalMember totMemberCount->" + totalMemberCount);
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmTotalMember Exception->" + e.getMessage());
		}
		return totalMemberCount;
	}
	
	@Override
	public int jmTotalMemberReal() { //총 멤버수
		int totalMemberCount = 0;
		System.out.println("JmMemberDaoImpl Start jmTotalMember...");

		try { // 매퍼 사용. yml -> mappers/Emp->네임스페이스.select id
			totalMemberCount = session.selectOne("com.oracle.hellong.MemberMapper.jmMemberTotalReal");
			//null이 아니라 0으로 찾긴 찾았는데.. -> 데이터 넣고 커밋을 안해서 
			System.out.println("JmMemberDaoImpl jmTotalMember totMemberCount->" + totalMemberCount);
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmTotalMember Exception->" + e.getMessage());
		}
		return totalMemberCount;
	}
	
	@Override
	public List<Member> jmListMember(Member member) { //멤버 리스트로 뽑아 출력용
		List<Member> memberList = null;
		System.out.println("JmMemberDaoImpl jmListMember Start ...");
		try { // Map Id : member.xml에서의 id
			// parameter=그냥 이 메서드의 인자
			memberList = session.selectList("jmMemberListAll", member); //리스트 멤버
			System.out.println("JmMemberDaoImpl jmListMember memberList.size()->" + memberList.size());
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmListMember e.getMessage()->" + e.getMessage());
		}
		return memberList;
	}
	
	@Override
	public List<Member> jmListMemberReal(Member member) { //멤버 리스트로 뽑아 출력용
		List<Member> memberList = null;
		System.out.println("JmMemberDaoImpl jmListMemberReal Start ...");
		try { 
			memberList = session.selectList("jmMemberListAllReal", member); //리스트 멤버
			//controller에서 멤버 안에 있는 start와 end를 설정하고, 멤버를 보내 여기까지 가져와
			// 그걸 넣어서 출력된 멤버들을 리스트에 넣음
			
			System.out.println("JmMemberDaoImpl jmListMemberReal memberList.size()->" + memberList.size());
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmListMemberReal e.getMessage()->" + e.getMessage());
		}
		return memberList;
	}
	


	@Override
	public Member jmDetailMember(int m_number) { //멤버 상세정보 detail 보는 목적
		System.out.println("JmMemberDaoImpl jmDetailMember start..");
		Member member = new Member();
		try {
			// mapper ID , Parameter
			member = session.selectOne("jmMemberSelectOne", m_number);
			System.out.println("JmMemberDaoImpl jmDetailMember getM_number->" + member.getM_number());
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmDetailMember Exception->" + e.getMessage());
		}
		return member;
	}

	@Override
	public int jmUpdateMember(Member member) {
		System.out.println("JmMemberDaoImpl jmUpdateMember start..");
		int updateCount= 0;
		try {
			updateCount = session.update("jmMemberUpdate",member);
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmUpdateMember Exception->"+e.getMessage());
		}
		return updateCount;
	}

	@Override
	public int jmInsertMember(@Valid Member member) {
		int result = 0;
		System.out.println("jmMemberDaoImpl jmInsertMember Start..." );
		try {
			String hashedPassword = BCrypt.hashpw(member.getM_pw(), BCrypt.gensalt());
		    member.setM_pw(hashedPassword);
			result = session.insert("jmInsertMember",member);
		} catch (Exception e) {
			System.out.println("jmMemberDaoImpl jmInsertMember Exception->"+e.getMessage());
		}
		return result;
	}
	
	//회원가입시 아이디 중복체크용. m_id가 같은 멤버를 가져옴
		public Member jmGetMemberFromId(String m_id) { 
			System.out.println("JmMemberDaoImpl jmGetMemberFromId start..");
			Member member = new Member();
			try {
				member = session.selectOne("jmGetMemberFromId", m_id);
				System.out.println("JmMemberDaoImpl jmGetMemberFromId getM_id->" + member.getM_id());
			} catch (Exception e) {
				System.out.println("동일한 m_id 없음");
			}
			return member;
		}

		@Override
		public int jmDeleteMemberReal(int m_number) {
			System.out.println("JmMemberDaoImpl jmDeleteMemberReal start..");
			int result = 0;
			System.out.println("JmMemberDaoImpl jmDeleteMemberReal m_id->"+m_number);
			try {
				result  = session.delete("jmDeleteMemberReal",m_number);
				System.out.println("JmMemberDaoImpl jmDeleteMemberReal result->"+result);
			} catch (Exception e) {
				System.out.println("JmMemberDaoImpl jmDeleteMemberReal Exception->"+e.getMessage());
			}

			// TODO Auto-generated method stub
			return result;
		}

		@Override
		public int jmDeleteMemberFake(Member member) {
			System.out.println("JmMemberDaoImpl jmDeleteMemberFake start..");
			int deleteCount= 0;
			try {
				deleteCount = session.update("jmDeleteMemberFake",member);
			} catch (Exception e) {
				System.out.println("JmMemberDaoImpl jmDeleteMemberFake Exception->"+e.getMessage());
			}
			return deleteCount;
		}

		@Override
		public int jmCheckId(String m_id) {
			System.out.println("JmMemberDaoImpl jmCheckId start..");
			int checkIdCount= 0;
			try {
				checkIdCount = session.selectOne("jmCheckId",m_id);
			} catch (Exception e) {
				System.out.println("JmMemberDaoImpl jmCheckId Exception->"+e.getMessage());
			}
			return checkIdCount;
		}

		@Override
		public int jmLogin(String m_id, String m_pw) {
			int result=0;
			System.out.println("JmMemberDaoImpl jmLogin start..");
			try {
				System.out.println("JmMemberDaoImpl jmLogin m_id:"+m_id);
				System.out.println("JmMemberDaoImpl jmLogin m_pw:"+m_pw);
				String hashPw= session.selectOne("jmLogin", m_id);
				System.out.println("JmMemberDaoImpl jmLogin hashPw->"+hashPw);
				Member member=new Member();
				member = session.selectOne("jmGetMemberFromId", m_id);
				Boolean pwSameCheck=BCrypt.checkpw(m_pw, hashPw);
				System.out.println(pwSameCheck);
				 if ( member!= null) {
			            if (pwSameCheck==true) {
			                System.out.println("로그인 성공!");
			                result=1;
			            } else {
			                System.out.println("비밀번호가 일치하지 않습니다.");
			                result=0;
			            }
				 }
			         else {
			            System.out.println("해당 유저 정보를 찾을 수 없습니다.");
			            result=-1;
			        }
			} catch (Exception e) {
				System.out.println("jmMemberDaoImpl jmLogin Exception->"+e.getMessage());
			}
			
			return result;		
					
		}

		@Override
		public String jmGetIdFromMail(String mail) {
			System.out.println("JmMemberDaoImpl jmGetIdFromMail start..");
			String id= null;
			try {
				id = session.selectOne("jmGetIdFromMail", mail);
				System.out.println("JmMemberDaoImpl jmGetIdFromMail id->" + id);
			} catch (Exception e) {
				System.out.println("해당 이메일로 가입된 계정(아이디) 없음");
			}
			return id;
		}

		@Override
		public int jmGetM_numberFromIdAndEmail(String m_id, String m_email) {
			System.out.println("JmMemberDaoImpl jmGetM_numberFromIdAndEmail start..");
			System.out.println(m_id);
			System.out.println(m_email);
			Member member=new Member();
			member.setM_id(m_id);
			member.setM_email(m_email);
			int m_number= 0;
			try {
				m_number = session.selectOne("jmGetM_numberFromIdAndEmail", member);
				System.out.println("JmMemberDaoImpl jmGetM_numberFromIdAndEmail m_number->" + m_number);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println("해당 아이디와 이메일로 가입된 계정(m_number) 없음");
				m_number=0;
			}
			return m_number;
		}

		@Override 
		public String jmCheckPwDuple(int m_number, String m_pw) {
			System.out.println("JmMemberDaoImpl jmcheckPwDuple start..");
			System.out.println(m_number+" "+ m_pw);
//			Member member=new Member();
//			member.setM_number(m_number);
//			member.setM_pw(m_pw);
			String hashPw=null;
			Boolean pwSameCheck=false;
			String result=null;
			try {
				hashPw = session.selectOne("jmGetMemberPwFromNumber", m_number);
				System.out.println("jmMemberDaoImpl jmCheckPwDuple hashPw: "+hashPw);
				pwSameCheck=BCrypt.checkpw(m_pw, hashPw);
				System.out.println("jmMembeDaoImpl jmCheckPwDuple pwSameCheck: "+pwSameCheck);
				if(pwSameCheck==true) { //중복시
					result="duple"; 
				} else if(pwSameCheck==false) { //중복이 아닐 떄
					result="ok"; 
				}
				
			} catch (Exception e) {
				System.out.println("jmMembeDaoImpl jmCheckPwDuple pwSameCheck: "+pwSameCheck);
				System.out.println("JmMemberDaoImpl jmCheckPwDuple Exception->"+e.getMessage());
				result="error"; //오류시
			}
			return result; 
			
		}

		@Override
		public int jmResetPw(int m_number, String m_pw) {
			System.out.println("JmMemberDaoImpl jmResetPw start..");
			Member member=new Member();
			member.setM_number(m_number);
	
			String hashedPassword = BCrypt.hashpw(m_pw, BCrypt.gensalt());
			System.out.println(hashedPassword);
		    member.setM_pw(hashedPassword);
			
			System.out.println(member.getM_number());
			System.out.println(member.getM_pw());
			
			int updateCount= 0;
			try {
				updateCount = session.update("jmResetPw",member);
				//Member 를 보냄 : model의 Member를 의미 : 안에 멋대로 추가한 것들도 받음
				System.out.println("jmMembeDaoImpl jmResetPw updateCount: "+updateCount);
			} catch (Exception e) {
				System.out.println("jmMembeDaoImpl jmResetPw updateCount: "+updateCount);
				System.out.println("JmMemberDaoImpl jmResetPw Exception->"+e.getMessage());
			}
			return updateCount;
		}
		
//		@Override
//		public List<Member> jmListMemberReal(Member member) { //멤버 리스트로 뽑아 출력용
//			List<Member> memberList = null;
//			System.out.println("JmMemberDaoImpl jmListMemberReal Start ...");
//			try { 
//				memberList = session.selectList("jmMemberListAllReal", member); //리스트 멤버
//				//controller에서 멤버 안에 있는 start와 end를 설정하고, 멤버를 보내 여기까지 가져와
//				// 그걸 넣어서 출력된 멤버들을 리스트에 넣음
//				
//				System.out.println("JmMemberDaoImpl jmListMemberReal memberList.size()->" + memberList.size());
//			} catch (Exception e) {
//				System.out.println("JmMemberDaoImpl jmListMemberReal e.getMessage()->" + e.getMessage());
//			}
//			return memberList;
//		}

}
