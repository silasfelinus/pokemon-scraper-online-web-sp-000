class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @id = pokemon[:id]
    @name =pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end

  def self.find(id)
  end
end
