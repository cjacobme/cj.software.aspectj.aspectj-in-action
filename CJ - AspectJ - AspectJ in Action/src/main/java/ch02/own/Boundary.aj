package ch02.own;

/**
 * ensures that any change of a {@link Shape}s attributes keeps it in the boundaries of its
 * canvas.
 */
public aspect Boundary
{
	
	after(Shape shape) : execution( void Shape+.set*(..))
	&& ! execution(void Shape+.setCanvas(Canvas))
	&& this(shape)
	{
		System.out.println("shape changes " + shape.toString());
		Canvas canvas = shape.getCanvas();
		if (canvas != null)
		{
			Rectangle rectangle = shape.calculateExtension();
			Point lowerLeft = rectangle.getLowerLeft();
			Point upperRight = rectangle.getUpperRight();
			if (lowerLeft.getX() < 0
					|| lowerLeft.getY() < 0
					|| upperRight.getX() > canvas.getWidth()
					|| upperRight.getY() > canvas.getHeight())
			{
				String message = String.format("%s violated canvas width (%d), height (%d)",
						shape.toString(), canvas.getWidth(), canvas.getHeight());
				throw new IllegalArgumentException(message);
			}
		}
	}
}
