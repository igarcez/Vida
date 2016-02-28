public class DBServices : GLib.Object, IDBServices {
  private Database db;
  private string table_name;
  private HashMap<string, string> columns;

  public DBServices(table_name) {
    init(table_name);
  }

  private init(table_name) {
    this.table_name = table_name;
    define_columns ();
    check_and_create_db ();
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
    // TODO change to use a file on ~/.vida or something like that
    rc = Database.open ("./src/main/vala/db/testdb2", out db);
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
    // TODO change this to actually check
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

  public int insert(string content, string table, Gee.HashMap<string,string> where) {
    return 0;
  }

  public int delete(int id, string table) {
    return 0;
  }

  public string select(string select, string table, Gee.HashMap<string,string> where) {
    return "";
  }

  public int update(Gee.HashMap<string,string> set, string table, Gee.HashMap<string,string> map) {
    return 0;
  }
}