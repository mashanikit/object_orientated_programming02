class Book
  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date, :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
      return new_book
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

  def self.browse
    return @@on_shelf.sample
  end

  def lent_out?
    if @@on_loan.include?(self) == true
      return true
    else
      false
    end
  end

  def self.current_due_date
    date = Time.now
    @due_date = date + (7 * 24 * 60 * 60)
  end

  def borrow
    if lent_out? == true
      return false
    else
      @due_date = Book.current_due_date
      @@on_shelf.delete(self)
      @@on_loan << self
      return true
    end
  end

  def return_to_library
    if lent_out? == false
      return false
    else
      @@on_loan.delete(self)
      @@on_shelf << self
      @due_date = nil
      return true
    end
  end

  def self.overdue
    overdue = []
    @@on_loan.each do |book|
      if @due_date < Time.now
        overdue << book
      end
    end
    return overdue
  end

  def self.overdue     #returns a list of books whose due dates are in the past
    overdue = []
    @@on_loan.each do |book|
      if @due_date < Time.now
        overdue << book
      end
    end
    overdue
  end

end
