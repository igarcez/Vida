using Gtk;

public class ShellWindow : Window, IBaseView {

	private Toolbar toolbar;
	private ToolButton newEntryButton;
	private TextView textView;
	private ScrolledWindow scrolledWindow;
	private Box mainLayout;

	public ShellWindow() {
		init();
	}

	protected void init() {
		this.title = "Vida";
		this.window_position = WindowPosition.CENTER;
		set_default_size(640,480);

		toolbar = new Toolbar();
		toolbar.get_style_context().add_class(STYLE_CLASS_PRIMARY_TOOLBAR);

		newEntryButton = new ToolButton.from_stock(Stock.NEW);
		newEntryButton.label = "New Entry";
		newEntryButton.is_important = true;
		toolbar.add(newEntryButton);

		textView = new TextView();
		textView.editable = true;
		textView.cursor_visible = true;

		scrolledWindow = new ScrolledWindow(null, null);
		scrolledWindow.set_policy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
		scrolledWindow.add(this.textView);

		mainLayout = new Box(Orientation.VERTICAL, 0);
		mainLayout.pack_start(toolbar, false, true, 0);
		mainLayout.pack_start(scrolledWindow, true, true, 0);
		add(mainLayout);
	}

	public void connect_model(BaseModel baseModel) {
		ShellModel shellModel = (ShellModel)baseModel;
		this.destroy.connect(shellModel.close);
		this.newEntryButton.clicked.connect(shellModel.newEntry);
		shellModel.content_changed.connect(this.set_content);
	}

	public void set_content(string content) {
		this.textView.buffer.text = content;
	}

	public new void show() {
		this.show_all();
	}
}
