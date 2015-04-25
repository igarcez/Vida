using Gtk;

namespace Vida {
  public class Vida : Gtk.Window {
    static int main (string [] args) {
      Gtk.init (ref args);

      var vd = new Vida();
      vd.show_all ();

      Gtk.main ();
      return 0;
    }

    public Vida () {
      title = "Vida";
    }
  }
}