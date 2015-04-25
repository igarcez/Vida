using Gtk;

namespace Vida {
  public class JournalEntry : Gtk.TextView {
    public JournalEntry () {
      left_margin = 10;
      right_margin = 10;
    }

    public bool save (DbWrapper db) {
      string[] columns = {"one", "two"};
      int result = db.create_table ("teste", columns);
      stdout.printf ("check db %s", result.to_string ());
      return false;
    }
  }
}