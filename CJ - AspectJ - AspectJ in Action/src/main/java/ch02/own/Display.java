package ch02.own;

public class Display
		implements
		CanvasModifiedListener
{
	@Override
	public void notify(CanvasModifiedEvent event)
	{
		System.out.println("Display:");
		System.out.println("\t" + event.getAction());
		System.out.println("\t" + event.getShape());
		System.out.println();
	}
}
