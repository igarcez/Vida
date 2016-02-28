public interface IDBServices : GLib.Object {
  public abstract int insert(string content, string table, Gee.HashMap<string,string> where);
  public abstract int delete(int id, string table);
  public abstract string select(string select, string table, Gee.HashMap<string,string> where);
  public abstract int update(Gee.HashMap<string,string> set, string table, Gee.HashMap<string,string> map);
}