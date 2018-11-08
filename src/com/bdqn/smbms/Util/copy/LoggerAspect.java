package src.com.bdqn.smbms.Util.copy;

import org.springframework.stereotype.Component;
import java.util.Arrays;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
@Component 
@Aspect
public class LoggerAspect {
	
	private static Logger log = Logger.getLogger(LoggerAspect.class);
	
	@Pointcut("execution(* com.bdqn.smbms.service..*(..))")
	public void a() {}
	
	@Before("a()")
	public void before(JoinPoint jp) {
		log.info("调用"+jp.getTarget()+"的"+jp.getSignature().getName()+"方法，方法的参数为:"+Arrays.toString(jp.getArgs()));
	}
	
	@After("a()")
	public void after(JoinPoint jp) {
		log.info("调用"+jp.getTarget()+"的"+jp.getSignature().getName()+"方法，方法的参数为:"+Arrays.toString(jp.getArgs()));
	}
	
	@AfterReturning(pointcut="a()",returning="result")
	public void afterReturning(JoinPoint jp, Object result) {
		log.info("调用"+jp.getTarget()+"的"+jp.getSignature().getName()+"方法，方法的返回值为:"+result);
	}
}
