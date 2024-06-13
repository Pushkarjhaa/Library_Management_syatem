void main() {
  Book book1 = Book("Let us C", "Yashavant Kanetkar", 12345678, true);
  Book book2 =
      Book("The Dart Programming language ", "Gilad Bracha", 12345679, true);
  Library library = Library();
  library.addBook(book1);
  library.addBook(book2);
  library.listBook();

  Member member = Member("John wick", "M001");
  library.loansBook(book1, member);
  library.listLoansBook();
}

class Book {
  String title;
  String author;
  int isbn;
  bool isAvailable;
  Book(this.title, this.author, this.isbn, this.isAvailable);
}

class Library {
  List<Book> books = [];
  List<Loan> loans = [];

  void loansBook(Book book, Member member) {
    if (book.isAvailable) {
      book.isAvailable = false;
      loans.add(Loan(book, member, DateTime.now()));
    } else {
      print("${book.title} is not availble");
    }
  }

  void addBook(Book book) {
    books.add(book);
  }

  void listBook() {
    print("----List All books in Library----");
    for (var book in books) {
      print(
          "Title: ${book.title} Author: ${book.author} isbn: ${book.isbn} isAvaible: ${book.isAvailable}");
    }
  }

  void listLoansBook() {
    print("----List All books in Library----");
    for (var loan in loans) {
      print(
          "Title: ${loan.book.title} Author: ${loan.book.author} isbn: ${loan.book.isbn} isAvaible: ${loan.book.isAvailable}");
    }
  }
}

class Member {
  String name;
  String memberId;

  Member(this.name, this.memberId);
}

class Loan {
  Book book;
  Member member;
  DateTime loanDate;
  DateTime? returnDate;

  Loan(this.book, this.member, this.loanDate, [this.returnDate]);

  void returnBook() {
    returnDate = DateTime.now();
    book.isAvailable = true;
  }
}
