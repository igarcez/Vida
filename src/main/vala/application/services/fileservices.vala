public interface IFileService : GLib.Object {

	public abstract string openFile();
	public abstract string readFile(string filename);
}
