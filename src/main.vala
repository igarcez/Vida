using Gtk;

namespace Vida {
  public class Vida : Gtk.Window {
    private Gtk.Button add_entry_button;
    private Gtk.Button go_to_today_button;
    private Gtk.Button calendar_view_button;
    private Gtk.Button add_image_button;
    private Gtk.TextView text_editor;
    private Gtk.Box main_box;
    private Gtk.Box box_buttons;
    private Gtk.Box box_content;

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
      main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
      box_buttons = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
      box_content = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

      // todo change add new, calendar and image to icons
      add_entry_button = new Gtk.Button.with_label ("Add new Entry");
      go_to_today_button = new Gtk.Button.with_label ("Today");
      calendar_view_button = new Gtk.Button.with_label ("calendar");
      add_image_button = new Gtk.Button.with_label ("Add image");

      box_buttons.add (add_entry_button);
      box_buttons.add (go_to_today_button);
      box_buttons.add (calendar_view_button);
      box_buttons.add (add_image_button);

      //todo needs buffer
      text_editor = new Gtk.TextView ();

      box_content.add (text_editor);

      main_box.add (box_buttons);
      main_box.add (box_content);

      this.add (main_box);
    }

    private void connect_signals () {

    }
  }
}