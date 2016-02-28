using Gtk;

public class FileService : GLib.Object, IFileService {

	private IBaseView baseView;

	public FileService(IBaseView baseView) {
		this.baseView = baseView;
	}

	public string openFile() {
		string text = "";
		var file_chooser = new FileChooserDialog ("Open File", (Window)baseView,
                                      FileChooserAction.OPEN,
                                      Stock.CANCEL, ResponseType.CANCEL,
                                      Stock.OPEN, ResponseType.ACCEPT);
        	if (file_chooser.run () == ResponseType.ACCEPT) {
        		text = file_chooser.get_filename ();
        	}
       		file_chooser.destroy ();
		return text;
	}

	public string readFile(string filename) {
		try {
           		string text;
            		FileUtils.get_contents (filename, out text);
            		return text;
        	} catch (Error e) {
            		stderr.printf ("Error: %s\n", e.message);
        	}
		return "";
	}
}
