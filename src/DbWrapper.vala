// using Glib;
using Sqlite;
using Gee;

namespace Vida {
  public class DbWrapper : Object {
    private Database db;
    private string table_name;
    private HashMap<string, string> columns;

    public DbWrapper () {
      table_name = "journal_entries";
      define_columns ();
      check_and_create_db ();
    }

    public int save_entry () {
      return 0;
    }

    private void define_columns () {
      columns = new HashMap<string, string> ();
      columns.set ("id", "integer");
      columns.set ("content", "text");
      columns.set ("image", "text");
      columns.set ("created_at", "integer");
      columns.set ("updated_at", "integer");
    }

    private int check_and_create_db () {
      int rc;
      rc = Database.open ("./db/testdb2", out db);
      if (rc != Sqlite.OK) {
        stderr.printf ("Can't open database: %d, %s\n", rc, db.errmsg ());
        return 0;
      }

      if (!table_exist (table_name)) {
        create_journal_entry_table ();
      }

      return 1;
    }

    private bool table_exist (string name)  {
      return false;
    }

    private int create_journal_entry_table () {
      int hash_size = columns.size;
      int counter = 0;
      string cmd = "CREATE TABLE " + table_name + " (";
      foreach (var entry in columns.entries) {
        cmd += entry.key + " " + entry.value;
        counter++;
        if (counter != hash_size) {
          cmd += ", ";
        }
      }
      cmd += ");";
      return db.exec (cmd, null, null);
    }


  }
}