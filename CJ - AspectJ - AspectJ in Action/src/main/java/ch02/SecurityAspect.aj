package ch02;


public aspect SecurityAspect
{
	private Authenticator authenticator = new Authenticator();
	
	pointcut secureAccess()
		: execution( * MessageCommunicator.deliver(..));
	
	before() : secureAccess()
	{
		System.out.println("checking ant authenticating user...");
		authenticator.authenticate();
	}
}
