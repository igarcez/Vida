using Gtk;

namespace Vida {
  public class JournalEntry : Gtk.TextView {
    public JournalEntry () {
      left_margin = 10;
      right_margin = 10;
    }

    public bool save (DbWrapper db_wrapper) {
      int result = db_wrapper.save_entry ();
      stdout.printf ("check db %s", result.to_string ());
      return false;
    }
  }
}