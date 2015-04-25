using Gtk;

namespace Vida {
  public class Vida : Gtk.Window {
    private Gtk.Button add_entry_button;
    private Gtk.Button go_to_today_button;
    private Gtk.Button calendar_view_button;
    private Gtk.Button add_image_button;
    private Gtk.Box box;

    static int main (string [] args) {
      Gtk.init (ref args);

      var vd = new Vida();
      vd.show_all ();

      Gtk.main ();
      return 0;
    }

    public Vida () {
      title = "Vida";

      create_layout ();
      connect_signals ();
    }

    private void create_layout () {
      // move buttons to top bar
      box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

      // todo change add new, calendar and image to icons
      add_entry_button = new Gtk.Button.with_label ("Add new Entry");
      go_to_today_button = new Gtk.Button.with_label ("Today");
      calendar_view_button = new Gtk.Button.with_label ("calendar");
      add_image_button = new Gtk.Button.with_label ("Add image");

      box.add (add_entry_button);
      box.add (go_to_today_button);
      box.add (calendar_view_button);
      box.add (add_image_button);

      this.add(box);
    }

    private void connect_signals () {

    }
  }
}