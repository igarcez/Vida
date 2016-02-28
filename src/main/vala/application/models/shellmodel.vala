using Gtk;

public class ShellModel : BaseModel
{
	private IFileService fileService;
	private string fileName;
	private string fileContent;

	public ShellModel(IBaseView baseView, IFileService fileService) {
		base(baseView);
		View.connect_model(this);
		this.fileService = fileService;
	}

	public void openFile() {
		fileName = fileService.openFile();
		fileContent = fileService.readFile(fileName);
		content_changed(fileContent);
	}

	public void newEntry() {
		// for now, just clean the text
		content_changed("");
	}

	public void show() {
		View.show();
	}

	public void close() {
		Gtk.main_quit();
	}

	public signal void content_changed(string content);
}
