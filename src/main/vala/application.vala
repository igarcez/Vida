using Gtk;


public class ApplicationController : GLib.Object {

  private ShellModel shellModel;

  public ApplicationController() {
  }

  public void run()
  {
    IBaseView shellWindow = new ShellWindow();
    shellModel = new ShellModel(shellWindow, new FileService(shellWindow));
    shellModel.show();
  }

  public static int main(string[] args)
  {
    Gtk.init(ref args);
    ApplicationController applicationController = new ApplicationController();
    applicationController.run();
    Gtk.main();
    return 0;
  }
}
