using Gtk;

namespace Vida {
  public class JournalEntry : Gtk.TextView {
    public JournalEntry () {
      left_margin = 10;
      right_margin = 10;
    }
  }
}