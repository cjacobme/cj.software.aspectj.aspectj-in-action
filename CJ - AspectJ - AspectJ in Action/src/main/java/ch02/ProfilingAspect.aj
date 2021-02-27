package ch02;

public aspect ProfilingAspect 
{
	pointcut publicOperation()
		: execution(public * *.*(..));
	
	Object around() : publicOperation()
	{
		long start = System.currentTimeMillis();
		Object result = proceed();
		long finish = System.currentTimeMillis();
		long delta = finish - start;
		System.out.println(
				thisJoinPointStaticPart.getSignature() + " needed " + delta + " milliseconds");
		return result;
	}
}
