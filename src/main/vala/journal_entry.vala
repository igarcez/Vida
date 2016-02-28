using Gtk;
using Gee;

namespace Vida {
  public class JournalEntry : Gtk.TextView {
    private int entry_id;
    private string image;
    private new HashMap<string, string> current_entry_content;

    public JournalEntry () {
      left_margin = 10;
      right_margin = 10;
      entry_id = 0;
      image = "";
      this.buffer.text = "Digite";
    }

    public int get_entry_id () {
      return entry_id;
    }

    public void load (int id) {

    }

    public bool save (DbWrapper db_wrapper) {
      current_entry_content = new HashMap<string, string> ();
      current_entry_content.set ("id", entry_id.to_string ());
      current_entry_content.set ("content", this.buffer.text);
      current_entry_content.set ("image", image);

      int result = db_wrapper.save_entry ( current_entry_content );
      stdout.printf ("check db %s", result.to_string ());
      return true;
    }
  }
}