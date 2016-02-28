public class DBServices : GLib.Object, IDBServices {
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