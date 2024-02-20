package team.hellong.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component //더미클래스
public class LogAop { 
	//aop 테스트 이후에는 아래 전체 죽임
	//이 MemberDao 안에 있는 모든 메소드를 around
	@Pointcut("within(com.oracle.oBootMybatis01.dao.MemberDao*)")
	private void pointcutMethod() {}
	
	@Around("pointcutMethod()")		//joinPoint = around방식이므로 @around를 해준다
	public Object loggerAop(ProceedingJoinPoint joinPoint) throws Throwable {

		//EmpDao 안에서 수행되는 핵심 관심사
		String signatureStr=joinPoint.getSignature().toString();
		System.out.println(signatureStr+"is start...");
		//이렇게 실행되면서 인터셉트. 
		long st=System.currentTimeMillis(); //시간체크용. 1/1000초 단위..
		try {
			Object obj=joinPoint.proceed(); //수행중.. 프록시 방식.
			
			return obj;
		} finally { //수행이 끝나면..
			long et=System.currentTimeMillis();
			System.out.println(signatureStr+" is finished.");
			System.out.println(signatureStr+" 경과시간:"+(et-st)); //시간 체크
			
		}
		
	}
	
	@Before("pointcutMethod()")
	public void before() { //위의 around와 충돌. 둘중 
		System.out.println("AOP Before...");
	}
}