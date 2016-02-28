using Gtk;

namespace Vida {
  public class Vida : Gtk.Window {
    private Gtk.Button add_entry_button;
    private Gtk.Button go_to_today_button;
    private Gtk.Button calendar_view_button;
    private Gtk.Button add_image_button;
    private JournalEntry text_editor;
    private Gtk.Box main_box;
    private Gtk.Box box_buttons;
    private Gtk.ScrolledWindow content_windown;
    public DbWrapper db;

    // helpers
    private int key_press_count;

    // static int main (string [] args) {
    //   Gtk.init (ref args);

    //   var vd = new Vida();
    //   vd.show_all ();

    //   Gtk.main ();
    //   return 0;
    // }

    public Vida () {
      title = "Vida";
      border_width = 0;
      set_default_size (800, 600);

      key_press_count = 0;

      db = new DbWrapper ();

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
      main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
      box_buttons = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 5);
      content_windown = new Gtk.ScrolledWindow (null, null);
    }

    private void create_buttons () {
      add_entry_button = new Gtk.Button.with_label ("Add new Entry");
      go_to_today_button = new Gtk.Button.with_label ("Today");
      calendar_view_button = new Gtk.Button.with_label ("Calendar");
      add_image_button = new Gtk.Button.with_label ("Add image");
    }

    private void add_buttons () {
      box_buttons.add (add_entry_button);
      box_buttons.add (go_to_today_button);
      box_buttons.add (calendar_view_button);
      box_buttons.add (add_image_button);
    }

    private void create_text_editor () {
      text_editor = new JournalEntry ();
    }

    private void add_text_editor () {
      content_windown.set_min_content_height (450);
      content_windown.add (text_editor);
    }

    private void fill_and_add_main_box () {
      main_box.add (box_buttons);
      main_box.add (content_windown);
      this.add (main_box);
    }

    private void connect_signals () {
      this.key_press_event.connect (on_key_pressed);
    }

    private bool on_key_pressed () {
      key_press_count++;
      key_press_count %= 30;
      if (key_press_count == 0) {
        stdout.printf ("saving the text now");
        text_editor.save (db);
      }
      return false;
    }
  }
}