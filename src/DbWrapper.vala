// using Glib;
using Sqlite;

namespace Vida {
  public class DbWrapper : Object {
    private Database db;

    public DbWrapper () {
      check_and_create_db ();
    }

    public int check_and_create_db () {
      int rc;
      rc = Database.open ("./db/testdb2", out db);
      if (rc != Sqlite.OK) {
        stderr.printf ("Can't open database: %d, %s\n", rc, db.errmsg ());
        return 0;
      }
      return 1;
    }

    // todo implement columns definition through a hashmap
    public int create_table (string name, string[] columns) {
      string cmd = "CREATE TABLE " + name + " (data TEXT, num DOUBLE);";
      return db.exec (cmd, null, null);
    }


  }
}