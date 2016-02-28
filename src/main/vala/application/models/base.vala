
public interface IBaseView : GLib.Object
{
	public abstract void connect_model(BaseModel baseModel);
	public abstract void show();
}

public class BaseModel : GLib.Object
{
	private IBaseView baseView;
	public BaseModel(IBaseView baseView) {
		this.baseView = baseView;
	}
	public IBaseView View { get { return baseView; } }
}

