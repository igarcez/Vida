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
      border_width = 10;

      create_layout ();
      connect_signals ();
    }

    private void create_layout () {
      // move buttons to top bar
      create_boxes ();

      // todo change add new, calendar and image to icons
      create_buttons ();
      add_buttons ();

      //todo needs buffer
      create_text_editor ();
      add_text_editor ();

      fill_and_add_main_box ();
    }

    private void create_boxes () {
      main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
      box_buttons = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 5);
      box_content = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
    }

    private void create_buttons () {
      add_entry_button = new Gtk.Button.with_label ("Add new Entry");
      go_to_today_button = new Gtk.Button.with_label ("Today");
      calendar_view_button = new Gtk.Button.with_label ("calendar");
      add_image_button = new Gtk.Button.with_label ("Add image");
    }

    private void add_buttons () {
      box_buttons.add (add_entry_button);
      box_buttons.add (go_to_today_button);
      box_buttons.add (calendar_view_button);
      box_buttons.add (add_image_button);
    }

    private void create_text_editor () {
      text_editor = new Gtk.TextView ();
    }

    private void add_text_editor () {
      box_content.add (text_editor);
    }

    private void fill_and_add_main_box () {
      main_box.add (box_buttons);
      main_box.add (box_content);
      this.add (main_box);
    }

    private void connect_signals () {

    }
  }
}