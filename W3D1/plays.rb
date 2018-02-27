require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        title
      FROM
        plays
      WHERE
        title = #{title}
    SQL
    data.map { |datum| Play.new(datum)}
  end

  def self.find_by_playwright(name)
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        playwright
      FROM
        plays
      WHERE
        playwright = #{name}
    SQL

    data.map { |datum| Play.new(datum)}
  end
end

class Playwright
  attr_accessor :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute('SELECT * FROM playwrights')
    data.map{ |data_map| Playwright.new(data_map) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        name
      FROM
        playwright
      WHERE
        name = #{name}
    SQL

    data.map { |datum| Playwright.new(datum)}
  end

  def initialize(options)
    # super(title, year, playwright_id)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} is already in the database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwright (name, birth_year)
      VALUES
        (? ?)
      WHERE
        id = ?
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in the database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @id, @name, @birth_year)
      UPDATE
        playwright
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        plays
      FROM
        playwright
      JOIN
        plays
        ON playwright.id = plays.playwright_id
    SQL

    data.map{ |datum| Play.new(datum)}
  end
end
