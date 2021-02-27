package ch02;

public class Main
{
	public static void main(String[] args)
	{
		MessageCommunicator messageCommunicator = new MessageCommunicator();
		messageCommunicator.deliver("Wanna learn AspectJ?");
		messageCommunicator.deliver("Harry", "having fun?");
		System.out.println("last access was " + messageCommunicator.getLastAccessTime());
	}
}
